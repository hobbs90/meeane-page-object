# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "page-object/version"

Gem::Specification.new do |s|
  s.name = "meeane-page-object"
  s.version = PageObject::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ["Jeff Morgan/Steven Hobbs"]
  s.email = ["stevenhobbs@meeane.co.uk"]
  s.license       = 'MIT'
  s.homepage = "https://github.com/hobbs90/page-object"
  s.summary = %q{Page Object DSL for browser testing Columbus Direct websites based on Jeff Morgan's page-object gem (version 1.0.2}
  s.description = %q{Page Object DSL that works with both Watir and Selenium}

  s.rubyforge_project = "meeane-page-object"

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'watir-webdriver', '>= 0.6.9'
  s.add_dependency 'selenium-webdriver', '>= 2.42.0'
  s.add_dependency 'page_navigation', '>= 0.9'

  s.add_development_dependency 'rspec', '< 3.0'
  s.add_development_dependency 'cucumber', '>= 1.3.0'
  s.add_development_dependency 'yard', '>= 0.7.2'
  s.add_development_dependency 'rack', '>= 1.0'

end
