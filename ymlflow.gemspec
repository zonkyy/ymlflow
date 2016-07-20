# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ymlflow/version'

Gem::Specification.new do |spec|
  spec.name          = "ymlflow"
  spec.version       = Ymlflow::VERSION
  spec.authors       = ["akisute3"]
  spec.email         = ["akisute3@gmail.com"]

  spec.summary       = "ymlflow converts YAML file into UI Flows image."
  spec.description   = "ymlflow converts YAML file into UI Flows image."
  spec.homepage      = "https://github.com/akisute3/ymlflow"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = ["ymlflow"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
