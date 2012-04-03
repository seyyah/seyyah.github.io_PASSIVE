# Encoding: UTF-8
# ------------------------------------------------------------------------------
# Jekyll Sitesi Görevleri
# ------------------------------------------------------------------------------

namespace :site do
  HOST   = 'localhost'
  PORT   = 4000
  BROWSE = browse_command "'http://#{HOST}:#{PORT}/'"

  desc "siteyi oluştur"
  task :build do
    sh 'jekyll'
  end
  task :b => :build

  desc "siteyi sil"
  task :clean do
    rm_rf '_site'
  end
  task :c => :clean

  desc "siteyi oluştur ve görüntüle"
  task :run do
    fork do
      `while ! nc -z #{HOST} #{PORT}; do sleep 0.1; done; echo 'Running #{BROWSE}'; #{BROWSE}`
    end
    server_pid = Process.spawn("jekyll --server --auto --url http://#{HOST}:#{PORT}")
    trap('INT') do
      [server_pid].each { |pid| Process.kill(9, pid) rescue Errno::ESRCH }
      Rake::Task["site:clean"].invoke
      exit 0
    end
    [server_pid].each { |pid| Process.wait(pid) }
  end
  task :r => :run
end

# İsim uzayıyla anılan görev öntanımlı olarak siteyi oluştur ve görüntüle
desc "siteyi oluştur ve görüntüle"
task :site => ["site:run"]
