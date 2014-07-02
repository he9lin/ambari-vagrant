# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
CHEF_CLIENT_URL  = 'https://api.opscode.com/organizations/heyook'
CHEF_CLIENT_NAME = 'heyook-validator'
CHEF_CLIENT_KEY  = '~/.chef/heyook-validator.pem'

module ChefServerValidationSetup
  extend self

  def call(chef)
    chef.chef_server_url = CHEF_CLIENT_URL
    chef.validation_client_name = CHEF_CLIENT_NAME
    chef.validation_key_path = CHEF_CLIENT_KEY
  end
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.omnibus.chef_version = '11.12.2' # :latest
  config.berkshelf.enabled = true

  config.vm.box = "centos65"
  config.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.3/centos65-x86_64-20140116.box"
  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--memory", "2048"]
  end

  config.vm.define :c6501 do |node|
    node.vm.host_name = "c6501.ambari-server.heyook"
    node.vm.network :private_network, ip: "192.168.65.101"
    node.vm.network :forwarded_port, guest: 8080, host: 8080 # Ambari server
    node.vm.provision :chef_client do |chef|
      ChefServerValidationSetup.(chef)

      chef.add_role('ambari_server')
      chef.add_role('ambari_agent')
    end
  end

  config.vm.define :c6502 do |node|
    node.vm.host_name = "c6502.ambari-agent.heyook"
    node.vm.network :private_network, ip: "192.168.65.102"
    node.vm.provision :chef_client do |chef|
      ChefServerValidationSetup.(chef)

      chef.add_role('ambari_agent')
    end
  end
end
