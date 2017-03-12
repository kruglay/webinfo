# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'webinfo/version'

Gem::Specification.new do |spec|
  spec.name          = "webinfo"
  spec.version       = Webinfo::VERSION
  spec.authors       = ["kruglay"]
  spec.email         = ["kruglay@mail.ru"]

  spec.summary       = %q{A gem gets attributes value from web page}
  spec.homepage      = "https://github.com/kruglay/webinfo"
  spec.license       = "MIT"

   spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency "httparty", "~> 0.14.0"
  spec.add_runtime_dependency "nokogiri", "~> 1.7", ">= 1.7.0.1"

end
