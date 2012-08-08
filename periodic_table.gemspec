# -*- encoding: utf-8 -*-
require File.expand_path('../lib/periodic_table/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Ben Zhang"]
  gem.email         = ["bzhang@thoughtbot.com"]
  gem.description   = %q{This gem helps people build gem}
  gem.summary       = %q{This is the summary of this gem}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "periodic_table"
  gem.require_paths = ["lib"]
  gem.version       = PeriodicTable::VERSION

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_runtime_dependency 'savon'
  gem.add_runtime_dependency 'activesupport'
end
