$:.push File.expand_path('../lib', __FILE__)
require 'omniauth/bibles/version'

Gem::Specification.new do |s|
  s.name      = 'omniauth-bibles'
  s.version   = OmniAuth::Bibles::VERSION
  s.authors   = ['Dennis Walters']
  s.email     = ['dennis@elevatorup.com']
  s.summary   = 'Bibles.org strategy for OmniAuth'
  s.homepage  = 'http://accounts.bibles.org'

  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map {|f| File.basename(file)}
  s.require_paths = ['lib']

  s.add_runtime_dependency 'omniauth-oauth2', '~> 1.0'

  s.add_development_dependency 'rspec', '~> 2.14'
  s.add_development_dependency 'rake'
end
