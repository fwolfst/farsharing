require 'rake/testtask'

namespace :test do
  namespace :run do
    Rake::TestTask.new(:ci) do |t|
      t.libs << "test"
      t.test_files = FileList['test/**/*_test.rb'].exclude(
        'test/i18n_test.rb'
      ).exclude(
        'test/integration/**/*.*'
      ).exclude(
        'test/system/**/*.*'
      )
    end
  end
end
