# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

# TODO: Move this to env vars
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
  config.berkshelf.enabled    = true

  config.vm.box = "centos65"
  config.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.3/centos65-x86_64-20140116.box"

  config.vm.provider :digital_ocean do |provider, override|
    override.ssh.private_key_path = '~/.ssh/id_rsa'
    override.vm.box = 'digital_ocean'
    override.vm.box_url = "https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box"

    provider.client_id          = ENV['DIGITAL_OCEAN_CLIENT_ID']
    provider.api_key            = ENV['DIGITAL_OCEAN_API_KEY']
    provider.ssh_key_name       = ENV['DIGITAL_OCEAN_SSH_KEY']
    provider.image              = "CentOS 6.5 x64"
    provider.region             = "San Francisco 1"
    provider.size               = "8GB"
    # provider.private_networking = true
  end

  config.vm.define :do6501 do |node|
    node.vm.host_name = "do6501.ambari.heyooklabs.com"
    node.vm.provision :chef_client do |chef|
      ChefServerValidationSetup.(chef)

      chef.add_role('ambari_server')
      chef.add_role('ambari_agent')
    end
  end

  config.vm.define :do6502 do |node|
    node.vm.host_name = "do6502.ambari.heyooklabs.com"
    node.vm.provision :chef_client do |chef|
      ChefServerValidationSetup.(chef)

      chef.add_role('ambari_agent')
    end
  end

  config.vm.define :do6503 do |node|
    node.vm.host_name = "do6503.ambari.heyooklabs.com"
    node.vm.provision :chef_client do |chef|
      ChefServerValidationSetup.(chef)

      chef.add_role('ambari_agent')
    end
  end

  config.vm.define :do6504 do |node|
    node.vm.host_name = "do6504.ambari.heyooklabs.com"
    node.vm.provision :chef_client do |chef|
      ChefServerValidationSetup.(chef)

      chef.add_role('ambari_agent')
    end
  end

  config.vm.define :do6505 do |node|
    node.vm.host_name = "do6505.ambari.heyooklabs.com"
    node.vm.provision :chef_client do |chef|
      ChefServerValidationSetup.(chef)

      chef.add_role('ambari_agent')
    end
  end
end
