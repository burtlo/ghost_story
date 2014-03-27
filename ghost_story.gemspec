# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ghost_story/version'

Gem::Specification.new do |spec|
  spec.name          = "ghost_story"
  spec.version       = GhostStory::VERSION
  spec.authors       = ["Franklin Webber"]
  spec.email         = ["franklin.webber@gmail.com"]
  spec.summary       = %q{Ghost Story allows you to write a story in markdown. The story can then be
read back to you. A ghost story is both text and automated scripts that will
type out code.}
  spec.homepage      = "https://github.com/burtlo/ghost_story"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "dutchman", ">= 0.0.1"
  spec.add_dependency "formatador", "~> 0.2"
  spec.add_dependency "kramdown", "~> 1.1"
  spec.add_dependency "thor", "~> 0.18"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
