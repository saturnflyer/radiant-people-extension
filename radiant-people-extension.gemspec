# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "radiant-people-extension"

Gem::Specification.new do |s|
  s.name        = "radiant-people-extension"
  s.version     = RadiantPeopleExtension::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = RadiantPeopleExtension::AUTHORS
  s.email       = RadiantPeopleExtension::EMAIL
  s.homepage    = RadiantPeopleExtension::URL
  s.summary     = RadiantPeopleExtension::SUMMARY
  s.description = RadiantPeopleExtension::DESCRIPTION


  s.add_dependency 'will_paginate'
  s.add_dependency 'searchlogic'
  s.add_dependency 'merger'

  ignores = if File.exist?('.gitignore')
    File.read('.gitignore').split("\n").inject([]) {|a,p| a + Dir[p] }
  else
    []
  end
  s.files         = Dir['**/*'] - ignores
  s.test_files    = Dir['test/**/*','spec/**/*','features/**/*'] - ignores
  # s.executables   = Dir['bin/*'] - ignores
  s.require_paths = ["lib"]
end

