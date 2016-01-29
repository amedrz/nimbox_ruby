require File.expand_path('../../lib/nimbox', __FILE__)
require 'rspec'
require 'webmock/rspec'
require 'vcr'
require 'pry'

CLIENT_ID = '60e42c'
CLIENT_SECRET = 'd61fe'
ACCESS_TOKEN = '956d'
SITE = 'http://localhost:5000/api/v1'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures'
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.default_cassette_options = { match_requests_on: [:method] }
end
