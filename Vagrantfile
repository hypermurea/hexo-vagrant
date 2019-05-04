VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.6.5"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.box_check_update = true
  config.vm.network "forwarded_port", guest: 4000, host: 4000

  config.ssh.forward_agent = true

  config.vm.synced_folder "../", "/home/vagrant/blogs"

  config.vm.provider "virtualbox" do |vm|
    vm.memory = 2048
    vm.cpus = 2
  end

  config.vm.provision "shell", path: "provision.sh", privileged: false
end
