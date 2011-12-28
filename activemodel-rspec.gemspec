# -*- encoding: utf-8 -*-
require File.expand_path('../lib/activemodel-rspec/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["matthooks"]
  gem.email         = ["matthooks@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "activemodel-rspec"
  gem.require_paths = ["lib"]
  gem.version       = ActiveModel::Rspec::VERSION

  gem.add_development_dependency 'rake'
  
  gem.add_dependency 'rspec'
  gem.add_dependency 'activemodel', '~> 3.0'
end
