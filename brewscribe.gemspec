# -*- encoding: utf-8 -*-
require File.expand_path('../lib/brewscribe/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Andrew Nordman"]
  gem.email         = ["cadwallion@gmail.com"]
  gem.description   = %q{Beersmith file reader}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "brewscribe"
  gem.require_paths = ["lib"]
  gem.version       = Brewscribe::VERSION

  gem.add_development_dependency 'rspec'
  gem.add_dependency 'nokogiri'
  gem.add_dependency 'multi_xml'
end
