require 'spec_helper'

describe 'check_mk' do

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      let(:title) { 'check_mk'}

      describe 'Test agent installation for Redhat' do
        let(:params) {{:install => 'agent' } }
        describe 'case' do
          let(:params) {{:osfamily => 'RedHat'}}
          it { should contain_package('xinetd').with_ensure('latest')}
        end
      end
      

      context 'with check_mk::install => agent' do
        let(:params) { {:install => 'agent'} }
        context 'with ::osfamily => RedHat' do
          let(:params) { {:check_mk_agent => 'check_mk-agent-1.2.2p3-1.noarch.rpm'} }
          it { should contain_package('xinetd').with_ensure('latest')}
        end
      end

      it { should contain_class('check_mk')}

      context 'server' do
        let(:fact) {{:install => 'server'}}
        it { should contain_class('check_mk::server')}
      end
      it { should contain_class('check_mk::agent')}
    end
  end
end
