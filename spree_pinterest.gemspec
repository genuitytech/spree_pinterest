# encoding: UTF-8
$:.push File.expand_path("../lib", __FILE__)
require "spree_pinterest/version"

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_pinterest'
  s.version     = SpreePinterest::VERSION
  s.summary     = 'Pinterest button for Spree products'
  s.description = 'This extension provides a Pinterest "Pin it" button for your Spree product images.'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'Chad Boyd'
  s.email             = 'chad@genuitytech.com'
  s.homepage          = 'http://genuitytech.com'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '>= 1.0.0'

  s.add_development_dependency 'capybara', '1.0.1'
  s.add_development_dependency 'factory_girl'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.7'
  s.add_development_dependency 'sqlite3'
end
