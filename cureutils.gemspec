# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cureutils/version'

Gem::Specification.new do |spec|
  spec.name          = "cureutils"
  spec.version       = Cureutils::VERSION
  spec.authors       = ["Yamada, Yasuhiro"]
  spec.email         = ["greengregson@gmail.com"]
  spec.summary       = %q{Useful command line tool for Japanese battle heroine "Pretty Cure (Precure)".}
  spec.description   = %q{Commands which can smoothly deal with Precure-related data.}
  spec.homepage      = "https://github.com/greymd/cureutils"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency 'thor'
  spec.add_dependency 'rubicure'
  spec.add_dependency 'colorize'
  spec.add_dependency 'activesupport'
end