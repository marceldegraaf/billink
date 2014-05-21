require 'bundler/setup'
require 'simplecov'
require 'simplecov-rcov'
require "vcr"

SimpleCov.start

if ENV['CI_NAME'] == "codeship"
  SimpleCov.formatter = SimpleCov::Formatter::RcovFormatter
end

require "rspec/autorun"
require "billink"

VCR.configure do |vcr|
  vcr.cassette_library_dir = "spec/vcr"
  vcr.hook_into :webmock
end

RSpec.configure do |config|
  config.mock_with :rspec
  config.color_enabled = true
  config.tty = true
  config.formatter = :progress

  config.before(:each) do
    hash = YAML.load(File.open('./spec/billink.yml'))

    Billink.configure do |config|
      config.user_id      = hash['user_id']
      config.workflow_id  = hash['workflow_id']
      config.test_mode    = true
      config.debug_mode   = false
    end
  end
end
