require 'rspec-puppet'

fixture_path = File.expand_path(File.join(__File__, '..', '..', 'fixtures'))

Rspec.configure do |c|
  c.module_path = File.join(fixture_path, 'modules')
  c.manifests_dir = File.join(fixture_path, 'manifests')
end
