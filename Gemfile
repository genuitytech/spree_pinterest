source 'http://rubygems.org'

group :development do
  gem "guard-rspec"
end

group :test do
  gem 'ffaker'
  gem "fuubar"
  gem "nokogiri"

  # See https://github.com/spree/spree/issues/1155.  This can be removed
  # once they push the next release.
  gem "spree", :git => "git://github.com/spree/spree.git"
end

if RUBY_VERSION < "1.9"
  gem "ruby-debug"
else
  gem "ruby-debug19"
end

gemspec
