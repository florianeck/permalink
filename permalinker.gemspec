# -*- encoding: utf-8 -*-
require "./lib/permalinker/version"

Gem::Specification.new do |s|
  s.name        = "permalinker"
  s.version     = "1.0.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Florian Eck"]
  s.email       = ["it-support@friends-systems.de"]
  s.homepage    = "https://github.com/florianeck/permalink"
  s.summary     = "Generate permalink attributes on ActiveRecord, based on Permalink gem by Nando Vieira"
  s.description = s.summary

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "activerecord"
  s.add_development_dependency "sqlite3-ruby"
  s.add_development_dependency "test-unit"
  s.add_development_dependency "rspec"
  s.add_development_dependency "mongoid"
  s.add_development_dependency "mongo_mapper"
  s.add_development_dependency "bson_ext"
  s.add_development_dependency "pry-meta"
  s.add_development_dependency "rake"
end
