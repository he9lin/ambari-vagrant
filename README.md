# Setup Ambari clusters using Vagrant

## Requirements

Vagrant version used on this project: `1.6.3`

Vagrant plugins:

```
vagrant plugin install vagrant-omnibus
vagrant plugin install vagrant-digitalocean
```

build gem from https://github.com/heyook/vagrant-berkshelf

```
vagrant plugin install vagrant-berkshelf-2.0.1.gem
```

Cookbooks: `ohai` and `ambari`. See `Berksfile` for details

## Spin up servers

Currently supports digital ocean

## TODO

A client machine to run jobs?
Faster cookbooks upload to hosts
