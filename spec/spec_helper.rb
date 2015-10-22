require 'puppet'
require 'rubygems'
require 'rspec-puppet'
require 'coveralls'

Coveralls.wear!

fixture_path = File.expand_path(File.join(__FILE__, '..', 'fixtures'))

RSpec.configure do |c|
#  c.module_path = File.join(fixture_path, 'modules')
#  c.manifest_dir = File.join(fixture_path, 'manifests')

  c.module_path = File.join(File.dirname(__FILE__), '../../')
  c.manifest = '../../manifests/site.pp'
end
