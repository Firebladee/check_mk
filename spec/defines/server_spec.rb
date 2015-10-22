require 'spec_helper'

describe 'check_mk::server' do
  let(:title) {'test'}
  let(:params) {
    {
      :omd_site_home     => '/opt/omd/sites/test',
      :check_mk_location => '/opt/omd/sites/ALL/etc/check_mk',
      :check_mk_agent_location => '/opt/omd/sites/ALL/etc/check_mk/agents',
      :define_hostgroups => 'True',
      :generate_hostconf => 'True',
      :aggregate_check_mk => 'True',
      :define_servicegroups => 'True',
      :all_hosts => 'True',
      :name              => 'test',
    }
  }

  let :pre_condition do
    'File<<| tag == \'check_mk_remote\' |>>'
  end

  it { should have_exec_resource_count(3) }

  it { should contain_exec('check_mk_update_test')}

  it do
    should contain_file('/conf.d/main_test').with({
      'ensure' => 'directory',
    })
  end
end
