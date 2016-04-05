Vagrant.configure(2) do |config|

  config.vm.box = "centos64"
  config.vm.hostname = "vagrant-centos64"

  config.vm.network "forwarded_port", guest: 3000, host: 8080
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.provider :virtualbox do |vb|
    vb.memory = 2048
  end
end
