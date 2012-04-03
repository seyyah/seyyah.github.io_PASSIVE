# Encoding: utf-8
# ------------------------------------------------------------------------------
# Landslide Sunumları için Görevler
# ------------------------------------------------------------------------------

require 'pathname'
require 'pythonconfig'
require 'yaml'

# Site yapılandırmasında sunumlara ait bölümü al
CONFIG = Config.fetch('presentation', {})

# Sunum dizini
PRESENTATION_DIR = CONFIG.fetch('directory', 'p')
# Öntanımlı landslide yapılandırması
DEFAULT_CONFFILE = CONFIG.fetch('conffile', '_templates/presentation.cfg')
# Öntanımlı landslide javascript dosyası
DEFAULT_JSFILE = CONFIG.fetch('conffile', 'assets/presentation.js')
# Sunum indeksi
INDEX_FILE = File.join(PRESENTATION_DIR, 'index.html')
# İzin verilen en büyük resim boyutları
IMAGE_GEOMETRY = [ 733, 550 ]
# Bağımlılıklar için yapılandırmada hangi anahtarlara bakılacak
DEPEND_KEYS    = %w(source css js)
# Vara daima bağımlılık verilecek dosya/dizinler
DEPEND_ALWAYS  = %w(media)
# Hedef Görevler ve tanımları
TASKS = {
    :index   => 'sunumları indeksle',
    :build   => 'sunumları oluştur',
    :rebuild => 'sunumları (zorla) yeniden oluştur',
    :clean   => 'sunumları temizle',
    :view    => 'sunumları görüntüle',
    :run     => 'sunumları sun',
    :zip     => 'sunumları paketle',
    :optim   => 'resimleri iyileştir',
    :default => 'öntanımlı görev',
}

# ERB şablonları için
BINDING = binding

# Sunum bilgileri
presentation   = {}
# Etiket bilgileri
tag            = {}

class File
  @@absolute_path_here = Pathname.new(Pathname.pwd)
  def self.to_herepath(path)
    Pathname.new(File.expand_path(path)).relative_path_from(@@absolute_path_here).to_s
  end
  def self.to_filelist(path)
    File.directory?(path) ?
      FileList[File.join(path, '*')].select { |f| File.file?(f) } :
      [path]
  end
end

def png_comment(file, string)
  require 'chunky_png'
  require 'oily_png'

  image = ChunkyPNG::Image.from_file(file)
  image.metadata['Comment'] = 'raked'
  image.save(file)
end

def png_optim(file, threshold=40000)
  return if File.new(file).size < threshold
  %x(pngnq -f -e .png-nq #{file})
  out = "#{file}-nq"
  if File.exist?(out)
    $?.success? ? File.rename(out, file) : File.delete(out)
  end
  # İşlendiğini belirtmek için not düş.
  png_comment(file, 'raked')
end

def png_optimized?(file)
  # Imagemagick ile gelen identify çalışmıyor?
  # 	identify -format '%c' #{f}} =~ /[Rr]aked/
  system "egrep -qi 'extcomment.raked' #{file}"
end

def jpg_optim(file)
  %x(jpegoptim -q -m80 #{file})
  %x(mogrify -comment 'raked' #{file})
end

def optim
  pngs, jpgs = FileList["**/*.png"], FileList["**/*.jpg", "**/*.jpeg"]

  # Optimize edilmişleri çıkar.
  [pngs, jpgs].each do |a|
    a.reject! { |f| png_optimized?(f) }
  end

  # Boyut düzeltmesi yap.
  (pngs + jpgs).each do |f|
    w, h = %x{identify -format '%[fx:w] %[fx:h]' #{f}}.split.map { |e| e.to_i }
    size, i = [w, h].each_with_index.max
    if size and size > IMAGE_GEOMETRY[i]
      arg = (i > 0 ? 'x' : '') + IMAGE_GEOMETRY[i].to_s
      %x(mogrify -resize #{arg} #{f})
    end
  end

  pngs.each { |f| png_optim(f) }
  jpgs.each { |f| jpg_optim(f) }

  # Optimize edilmiş resimlerin kullanıldığı slaytları, bu resimler slayta
  # gömülü olabileceğinden tekrar üretelim.  Nasıl?  Aşağıdaki berbat
  # numarayla.  Resim'e ilişik bir referans varsa dosyaya dokun.
  (pngs + jpgs).each do |f|
    name = File.basename f
    FileList["*/*.md"].each do |src|
      %x(grep -q '(.*#{name})' #{src} && touch #{src})
    end
  end
end

# ------------------------------------------------------------------------------
# Ana kod
# ------------------------------------------------------------------------------

# Alt dizinlerde yapılandırma dosyasına mutlak dosya yoluyla erişiyoruz
default_conffile = File.expand_path(DEFAULT_CONFFILE)

new_files = %w(assets/my.css assets/my.js)
js_template = File.join('_templates', File.basename(DEFAULT_JSFILE)) + '.erb'

if File.exists? js_template
  file DEFAULT_JSFILE => [js_template, '_config.yml'] do |t|
    content = ERB.new(File.read(t.prerequisites[0])).result(BINDING)
    isnew = ! File.exists?(t.name)
    File.open(t.name, 'w') { |f| f.write content }
    cry "yeni dosya: '#{t.name}'; 'git add' ile depoya eklemeyi unutmayın" if isnew
  end
else
    new_files << DEFAULT_JSFILE
end

new_files.each do |f|
  unless File.exists? f
    %x(touch #{f})
    cry "yeni dosya: '#{f}'; 'git add' ile depoya eklemeyi unutmayın"
  end
end

# Sunum bilgilerini üret
FileList[File.join(PRESENTATION_DIR, "[^_.]*")].each do |dir|
  next unless File.directory?(dir)
  deps = []

  deps << default_conffile

  chdir dir do
    name = File.basename(dir)
    conffile = File.exists?('presentation.cfg') ? 'presentation.cfg' : default_conffile
    config = File.open(conffile, "r") do |f|
      PythonConfig::ConfigParser.new(f)
    end

    landslide = config['landslide']
    if ! landslide
      die "#{dir}: 'landslide' bölümü tanımlanmamış"
    end

    if landslide['destination']
      die "#{dir}: 'destination' ayarı kullanılmış; hedef dosya belirtilmeyin"
    end

    if File.exists?('index.md')
      source = 'index.md'
      base = 'index'
      ispublic = true
    elsif File.exists?('presentation.md')
      source = 'presentation.md'
      base = 'presentation'
      ispublic = false
    else
      die "#{dir}: sunum kaynağı 'presentation.md' veya 'index.md' olmalı"
    end

    basename = base + '.html'
    thumbnail = File.to_herepath(base + '.png')
    target = File.to_herepath(basename)

    # bağımlılık verilecek tüm dosyaları listele
    DEPEND_ALWAYS.compact.each do |v|
      deps += v.split.select { |p| File.exists?(p) }.map { |p| File.to_filelist(p) }.flatten
    end
    landslide.values_at(*DEPEND_KEYS).compact.each do |v|
      deps += v.split.map { |p| File.to_filelist(p) }.flatten
    end

    # eklenen kod dosyalarını da bağımlılıklara ekle
    # bu lojiğin burada yeri olmamalı, ama iş görüyor ;-)
    dirs = landslide['includepath'].split /:/
    IO.read(source).scan(/^[.](code|coden|include|includen)[:]\s+(\S+)/m).each do |m|
      dirs.each do |d|
        f = File.expand_path(File.join(d, m[1]))
        if File.exists?(f)
          deps << f
          break
        end
      end
    end

    # bağımlılık ağacının çalışması için tüm yolları bu dizine göreceli yap
    deps.map! { |e| File.to_herepath(e) }
    deps.delete(target)
    deps.delete(thumbnail)

    # TODO etiketleri işle
    tags = []

   presentation[dir] = {
      :basename  => basename,	# üreteceğimiz sunum dosyasının baz adı
      :source    => source,     # lanslide kaynağı
      :conffile  => conffile,	# landslide konfigürasyonu (mutlak dosya yolu)
      :deps      => deps,	# sunum bağımlılıkları
      :directory => dir,	# sunum dizini (tepe dizine göreli)
      :name      => name,	# sunum ismi
      :public    => ispublic,	# sunum dışarı açık mı
      :tags      => tags,	# sunum etiketleri
      :target    => target,	# üreteceğimiz sunum dosyası (tepe dizine göreli)
      :thumbnail => thumbnail, 	# sunum için küçük resim
    }
  end
end

# TODO etiket bilgilerini üret
presentation.each do |k, v|
  v[:tags].each do |t|
    tag[t] ||= []
    tag[t] << k
  end
end

# Görev tablosunu hazırla
tasktab = Hash[*TASKS.map { |k, v| [k, { :desc => v, :tasks => [] }] }.flatten]

# Görevleri dinamik olarak üret
presentation.each do |presentation, data|
  # her alt sunum dizini için bir alt görev tanımlıyoruz
  ns = namespace presentation do
    # sunum dosyaları
    file data[:target] => data[:deps] do |t|
      puts color(data[:name], :headline)
      chdir presentation do
        %x(landslide -i #{data[:conffile]})
        # XXX: Slayt bağlamı iOS tarayıcılarında sorun çıkarıyor.  Kirli bir çözüm!
        # cmd=%q[
        #   sed -i -e "s/^\([[:blank:]]*var hiddenContext *= *\)false\(;[[:blank:]]*$\)/\1true\2/" presentation.html
        # ]; %x(#{cmd})
        unless data[:basename] == 'presentation.html'
          mv 'presentation.html', data[:basename]
        end
      end
    end

    # küçük resimler
    file data[:thumbnail] => data[:target] do
      next unless data[:public]
      %x(
        cutycapt \
          --url=file://#{File.absolute_path(data[:target])}#slide1 \
          --out=#{data[:thumbnail]} \
          --user-style-string='div.slides { width: 900px; overflow: hidden; }' \
          --min-width=960 \
          --min-height=720 \
          --delay=1000
      )
      %x(mogrify -resize 240 #{data[:thumbnail]})
      png_optim(data[:thumbnail])
    end

    task :optim do
      chdir presentation do
        optim
      end
    end

    task :index => data[:thumbnail]

    task :force do
      %x(touch #{presentation}/#{data[:source]})
    end

    task :build => [:optim, data[:target], :index]

    desc "sadece bu sunumu yeniden oluştur"
    task :rebuild => [:force, :build]

    task :view do
      if File.exists?(data[:target])
        %x(#{browse_command data[:target]})
      else
        cry "#{data[:target]} bulunamadı; önce inşa edin"
      end
    end

    task :run => [:build, :view]

    task :clean do
      rm_f data[:target]
      rm_f data[:thumbnail]
    end

    task :zip => [:build] do
      t = "_archive/#{data[:name]}"
      %x(mkdir -p _archive; cp #{data[:target]} #{t}.html; zip -jm #{t}.zip #{t}.html)
    end
  end

  # alt görevleri görev tablosuna işle
  ns.tasks.map(&:to_s).each do |t|
    _, _, name = t.partition(":").map(&:to_sym)
    next unless tasktab[name]
    tasktab[name][:tasks] << t
  end
end

namespace :p do
  # görev tablosundan yararlanarak üst isim uzayında ilgili görevleri tanımla
  tasktab.each do |name, info|
    desc info[:desc]
    task name => info[:tasks]
    task name[0] => name
  end

  task :index do
    index = YAML.load_file(INDEX_FILE) || {}
    presentations = presentation.values.select { |v| v[:public] }.map { |v| v[:directory] }.sort
    unless index and presentations == index['presentations']
      index['presentations'] = presentations
      File.open(INDEX_FILE, 'w') do |f|
        f.write(index.to_yaml)
        f.write("---\n")
      end
    end
  end

  task :build do
    Rake::Task["p:index"].invoke
  end

  desc "sunum menüsü"
  task :menu do
    lookup = Hash[
      *presentation.sort_by do |k, v|
        File.mtime(File.exists?(v[:target]) ? v[:target] : v[:directory])
      end
      .reverse
      .map { |k, v| [v[:name], k] }
      .flatten
    ]
    name = choose do |menu|
      menu.default = "1"
      menu.prompt = color(
        'Lütfen sunum seçin ', :headline
      ) + '[' + color("#{menu.default}", :special) + ']'
      menu.choices(*lookup.keys)
    end
    directory = lookup[name]
    Rake::Task["#{directory}:run"].invoke
  end
  task :m => :menu
end

desc "sunum menüsü"
task :p => ["p:menu"]
task :presentation => :p

task :default do
  Rake::Task["p:build"].invoke
end
