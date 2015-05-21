# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mr_freeze/version'

Gem::Specification.new do |spec|
  spec.name          = "mr_freeze"
  spec.version       = MrFreeze::VERSION
  spec.authors       = ["Matthew Rudy Jacobs"]
  spec.email         = ["matthewrudyjacobs@gmail.com"]

  spec.summary       = %q{freeze objects nestedly}
  spec.description   = %q{Object#freeze! freezes the contents of arrays and hashes}
  spec.homepage      = "https://github.com/matthewrudy/mr_freeze"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "activesupport"
  spec.add_development_dependency "test-unit"
end
