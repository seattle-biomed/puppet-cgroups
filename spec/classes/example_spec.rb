require 'spec_helper'

describe 'cgroups' do
  let(:title) { 'cgroups' }

  ['Debian', 'RedHat'].each do |osfamily|
    describe "cgroups class without any parameters on #{osfamily}" do 
      let(:params) {{ }}
      let(:facts) { { :osfamily => osfamily } }

      it { should create_class('cgroups') }
      it { should create_package('cgroups') }
      it { should create_file('/etc/cgroups.conf') }
      it {
        should create_file('/etc/cgroups.conf')\
        .with_content(/^server pool.cgroups.org$/)
      }
      if osfamily == 'RedHat' 
        it { should create_service('cgroupsd') }
      else
        it { should create_service('cgroups') }
      end
    end
  end
end
