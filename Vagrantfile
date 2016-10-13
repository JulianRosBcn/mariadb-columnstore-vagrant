Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
  end
  config.vm.provider "libvirt" do |lv|
    lv.memory = 4096
  end
  config.vm.hostname = "columnstore.local"
  config.vm.box = "centos/7"
  config.vm.provision :shell, path: "bootstrap.sh"
end
