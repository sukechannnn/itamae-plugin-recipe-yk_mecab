require 'spec_helper'

%w{wget make}.each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

describe package('gcc-c++'), if: ['redhat', 'fedora', 'amazon'].include?(os[:family]) do
  it { should be_installed }
end

describe package('g++'), if: ['debian', 'ubuntu'].include?(os[:family]) do
  it { should be_installed }
end

describe command('ruby -v') do
  let(:disable_sudo) { true }
  its(:exit_status) { should eq 0 }
end

describe package('nkf') do
  it { should be_installed }
end

describe file('/usr/local/bin/mecab') do
  it { should be_file }
  it { should be_executable }
end

describe file('/usr/local/lib/mecab/dic/ipadic/') do
  it { should be_directory }
end

describe file('/home/vagrant/custom.dic') do
  it { should be_file }
end
