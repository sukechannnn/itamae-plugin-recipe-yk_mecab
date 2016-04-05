require 'spec_helper'

%w{gcc-c++ wget make}.each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

describe package('ruby') do
  it { should be_installed }
end

describe package('nkf') do
  it { should be_installed }
end

describe package('mecab-0.994') do
  it { should be_installed }
end

# describe package('httpd'), :if => os[:family] == 'redhat' do
#   it { should be_installed }
# end
#
# describe package('apache2'), :if => os[:family] == 'ubuntu' do
#   it { should be_installed }
# end
#
# describe service('httpd'), :if => os[:family] == 'redhat' do
#   it { should be_enabled }
#   it { should be_running }
# end
#
# describe service('apache2'), :if => os[:family] == 'ubuntu' do
#   it { should be_enabled }
#   it { should be_running }
# end
#
# describe service('org.apache.httpd'), :if => os[:family] == 'darwin' do
#   it { should be_enabled }
#   it { should be_running }
# end
#
# describe port(80) do
#   it { should be_listening }
# end
