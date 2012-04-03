# Encoding: utf-8
# ------------------------------------------------------------------------------
# Global Görevler
# ------------------------------------------------------------------------------

GIT_AUTO_COMMIT_MESSAGE = '.'

desc "'#{GIT_AUTO_COMMIT_MESSAGE}' değişiklik iletisiyle kaydet ve gönder"
task :submit do
  %x(git commit -a -m #{GIT_AUTO_COMMIT_MESSAGE})
  %x(git push)
end

# Kısayol
task :s => :submit
