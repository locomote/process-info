# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "process_info/version"
require "posix/spawn"

Gem::Specification.new do |spec|
  spec.name          = "process-info"
  spec.version       = ProcessInfo::VERSION
  spec.authors       = %w{ John Carney }
  spec.email         = %w{ john@carney.id.au }
  spec.summary       = %q{Simple library for gettig system process information}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = %w{ lib }

  spec.required_ruby_version = '>= 2.1.0'

  spec.add_dependency "posix-spawn", "~> 0.3.11"

  spec.add_development_dependency "bundler", "~> 1.10.6"
  spec.add_development_dependency "rake"
end
