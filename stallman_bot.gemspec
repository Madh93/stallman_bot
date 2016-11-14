# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stallman_bot/version'

Gem::Specification.new do |spec|
  spec.name          = "stallman_bot"
  spec.version       = StallmanBot::VERSION
  spec.authors       = ["Madh93"]
  spec.email         = ["michelangelo93@gmail.com"]

  spec.summary       = "Richard M. Stallman a.k.a. St. iGNUcius"
  spec.description   = "Richard M. Stallman a.k.a. St. iGNUcius"
  spec.homepage      = "https://github.com/Madh93/stallman_bot"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.executables   = "stallman_bot"
  spec.require_paths = ["lib"]

  spec.add_development_dependency("bundler", "~> 1.13")
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.required_ruby_version = '>= 2.2.5'
end
