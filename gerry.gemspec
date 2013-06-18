$LOAD_PATH.unshift 'lib'
require "gerry/version"

Gem::Specification.new do |s|
  s.name              = "gerry"
  s.version           = Gerry::VERSION
  s.date              = Time.now.strftime('%Y-%m-%d')
  s.summary           = "Simple Ruby wrapper for the Gerrit Code Review REST-API."
  s.homepage          = "http://github.com/aerickson/gerry"
  s.email             = "mettler.fabian@gmail.com"
  s.authors           = [ "Fabian Mettler", "Andrew Erickson" ]
  s.has_rdoc          = false

  s.files             = %w( README.md Rakefile )
  s.files            += Dir.glob("lib/**/*")
  s.test_files       += Dir.glob("spec/**/*")

  s.description       = <<desc
  Simple Ruby wrapper for the Gerrit Code Review REST-API.
desc

  s.add_runtime_dependency      'httparty'

  s.add_development_dependency  'rake'
  s.add_development_dependency  'rspec'
  s.add_development_dependency  'rack-test'
  s.add_development_dependency  'webmock'
end
