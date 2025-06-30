#source 'https://ruby.taobao.org'
source 'https://rubygems.org'

gem 'thin', '1.6.2'
gem "rails", "4.2.0"
gem "jquery-rails", "3.1.4"
gem "coderay", "1.1.0"
gem "builder", "3.2.2"
gem "request_store", "1.0.5"
gem "mime-types", '2.6.2'
gem "protected_attributes", '1.1.3'
gem "actionpack-action_caching", '1.1.1'
gem "actionpack-xml_parser", '1.0.2'

gem 'rack', '1.6.4'

gem 'httparty', '0.13.5'
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :x64_mingw, :mswin, :jruby]
gem "rbpdf", "1.18.6"

# Optional gem for LDAP authentication
group :ldap do
  gem "net-ldap", "0.3.1"
end

# Optional gem for OpenID authentication
group :openid do
  gem "ruby-openid", "2.3.0", :require => "openid"
  gem "rack-openid", '1.4.2'
end

platforms :mri, :mingw, :x64_mingw do
  # Optional gem for exporting the gantt to a PNG file, not supported with jruby
  group :rmagick do
    gem "rmagick", "2.15.4"
  end

  # Optional Markdown support, not for JRuby
  group :markdown do
    gem "redcarpet", "3.1.2"
  end
end

# Include database gems for the adapters found in the database
# configuration file
require 'erb'
require 'yaml'
database_file = File.join(File.dirname(__FILE__), "config/database.yml")
if File.exist?(database_file)
  database_config = YAML::load(ERB.new(IO.read(database_file)).result)
  adapters = database_config.values.map {|c| c['adapter']}.compact.uniq
  if adapters.any?
    adapters.each do |adapter|
      case adapter
      when 'mysql2'
        gem "mysql2", "0.3.20", :platforms => [:mri, :mingw, :x64_mingw]
      else
        warn("Unknown database adapter `#{adapter}` found in config/database.yml, use Gemfile.local to load your own database gems")
      end
    end
  else
    warn("No adapter found in config/database.yml, please configure it first")
  end
else
  warn("Please configure your config/database.yml first")
end

group :development do
  gem "rdoc", "4.2.0"
  gem "yard", '0.8.7.6'
end

group :test do
  gem "minitest", '5.8.1'
  gem "rails-dom-testing", '1.0.7'
  gem "mocha", '1.1.0'
  gem "simplecov", "0.9.2", :require => false
  # For running UI tests
  gem "capybara", '2.5.0'
  gem "selenium-webdriver", '2.48.0'
end

local_gemfile = File.join(File.dirname(__FILE__), "Gemfile.local")
if File.exists?(local_gemfile)
  eval_gemfile local_gemfile
end

# Load plugins' Gemfiles
Dir.glob File.expand_path("../plugins/*/{Gemfile,PluginGemfile}", __FILE__) do |file|
  eval_gemfile file
end
