Gem::Specification.new do |s|
  s.name = 'signum'
  s.version = '0.0.1'
  s.authors = ['Florian Hanke', 'Jens-Christian Fischer']
  s.email = 'jens-christian@invisible.ch'
  s.homepage = 'http://github.com/jcfischer/signum'
  s.platform = Gem::Platform::RUBY
  s.summary = "Library to create and compare signatures of parameter hashes"
  s.description = 'Sign and compare signatures of parameters passed to a web application.'
  s.files = Dir["lib/**/*.rb"]
  s.test_files = Dir["spec/**/*spec.rb"]
  s.has_rdoc = false
  s.extra_rdoc_files = ['README.md']
end
