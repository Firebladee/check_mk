require 'spec_helper'

describe 'check_mk::agent' do
  let(:title) {'test'}
  let(:node) { 'rspec.fireblade.com'}
  let(:params) {
    { 'check_mk_location' => '/opt/omd/sites/ALL/etc/check_mk',
      'check_mk_agent'    => 'check_mk-agent-1.2.2p3-1.noarch.rpm',
      'omd_site_home'     => '/opt/omd/sites/test',
    }
  }

  context 'redhat' do
    let(:facts) {{:osfamily => 'RedHat' }}
    it do
#      should contain_file('/tmp/check_mk-agent-1.2.2p3-1.noarch.rpm')
    end
#    it {should contain_package('xinetd').only_with_ensure('latest')}
  end

  it do
#    should contain_file('/conf.d/main').with({
#      'ensure' => 'directory',
#    })
  end

  it 'should create a check_mk::agent file' do
#    should contain_file('/opt/omd/sites/test/opt/omd/sites/ALL/etc/check_mk/conf.d/main/rspec.fireblade.com.mk')
  end
end

at_exit { RSpec::Puppet::Coverage.report!}
