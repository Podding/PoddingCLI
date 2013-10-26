# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'podding-cli/version'

Gem::Specification.new do |spec|
  spec.name          = "podding-cli"
  spec.version       = PoddingCLI::VERSION
  spec.authors       = ["sirmarcel"]
  spec.email         = ["me@lumenlog.com"]
  spec.description   = "A basic CLI for interacting with podding"
  spec.summary       = "podding-cli is a CLI for podding"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_runtime_dependency "thor"
  spec.add_runtime_dependency "settingslogic"
  spec.add_runtime_dependency "miniphonic"
end
