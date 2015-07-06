VAGRANTFILE_API_VERSION = "2"

Vagrant.configure("2") do |config|
  # other config here
  config.vm.box = "webserver2"
  config.vm.synced_folder ".", "/home/vagrant"
  # config.vm.network "public_network", bridge: 'wlan0'
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 5432, host: 5432
  config.vm.network "forwarded_port", guest: 27017, host: 27017
  config.vm.provision "shell", path: "scripts/setup.sh"
  
  config.persistent_storage.enabled = true
  config.persistent_storage.location = "~/development/sourcehdd.vdi"
  config.persistent_storage.size = 30000
  config.persistent_storage.mountname = 'db'
  config.persistent_storage.filesystem = 'ext4'
  config.persistent_storage.mountpoint = '/var/lib/postgresql/'
	
  config.vm.provider "virtualbox" do |v|
        v.memory = 1024
	v.cpus = 2
  end

end
