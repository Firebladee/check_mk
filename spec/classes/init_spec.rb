require 'spec_helper'

describe 'check_mk' do

  let(:title) { 'check_mk'}

  describe 'Test agent installation for Redhat' do
    let(:params) {{:install => 'agent' } }
#    describe 'case' do
#      let(:params) {{:osfamily => 'RedHat'}}
#      it { should contain_package('xinetd').with_ensure('latest')}
#    end
  end
      

#  context 'with check_mk::install => agent' do
#   let(:params) { {:install => 'agent'} }
#   context 'with ::osfamily => RedHat' do
#      let(:params) { {:check_mk_agent => 'check_mk-agent-1.2.2p3-1.noarch.rpm'} }
#      it { should contain_package('xinetd').with_ensure('latest')}
      
#    end
#  end

end
