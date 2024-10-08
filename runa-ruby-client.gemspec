# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'runa/version'

Gem::Specification.new do |spec|
  spec.name          = 'runa-ruby-client'
  spec.version       = Runa::VERSION
  spec.authors       = ['Luke Oglesby']
  spec.email         = ['luke.oglesby@mo.work']

  spec.summary       = 'A simple Ruby client for the Runa Connect API'
  spec.homepage      = 'https://github.com/mo-work/runa-ruby-client'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.4.0'

  spec.add_dependency 'faraday', '~> 1.0', '>= 1.0.0'
  spec.add_dependency 'faraday_middleware', '~> 1.2'
  spec.add_dependency 'json', '~> 2.3', '>= 2.3.0'

  spec.add_development_dependency 'bundler', '~> 2.3.12'
  spec.add_development_dependency 'byebug', '~> 11'
  spec.add_development_dependency 'dotenv', '~> 2.2', '>= 2.2.0'
  spec.add_development_dependency 'rake', '~> 12.3', '>= 12.3.3'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'vcr', '~> 3.0', '>= 3.0.3'
  spec.add_development_dependency 'webmock', '~> 3.5', '>= 3.5.0'
end
