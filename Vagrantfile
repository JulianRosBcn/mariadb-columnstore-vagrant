Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
  end
  config.vm.box = "centos/7"
  config.vm.provision "file", source: "columnstore", destination: "columnstore"
  config.vm.provision :shell, path: "bootstrap.sh"
end
