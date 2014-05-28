# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "billink/version"

Gem::Specification.new do |s|
  s.name        = "billink"
  s.version     = Billink::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Marcel de Graaf"]
  s.email       = ["mail@marceldegraaf.net"]
  s.homepage    = "http://github.com/marceldegraaf/billink"
  s.summary     = %q{Ruby gem to integrate with the Billink API.}
  s.description = %q{This gem implements the API of the Billink invoice payment service provider.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'httpi'
  s.add_dependency 'hashie'
  s.add_dependency 'crack'
  s.add_dependency 'gyoku'

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'vcr'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'simplecov-rcov'
  s.add_development_dependency 'fabrication'

end
