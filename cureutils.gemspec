# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cureutils/version'

Gem::Specification.new do |spec|
  spec.name          = 'cureutils'
  spec.version       = Cureutils::Version
  spec.authors       = ['Yamada, Yasuhiro']
  spec.email         = ['yamadagrep@gmail.com']
  spec.summary       = 'Useful commands for battle heroine Pretty Cure (Precure).'
  spec.description   = 'Useful command line tool for Japanese battle heroine Pretty Cure (Precure).'
  spec.homepage      = 'https://github.com/greymd/cureutils'
  spec.license       = 'MIT'
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.2.2'
  spec.add_development_dependency 'bundler', '>= 1.11'
  spec.add_development_dependency 'rake', '>= 12.3.3'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_dependency 'thor', ['>= 0.19.1', '< 2']
  spec.add_dependency 'rubicure', '~> 1.3.0'
  spec.add_dependency 'colorize', '~> 0.7.7'
  spec.add_dependency 'activesupport', '>= 5.0.0'
end
