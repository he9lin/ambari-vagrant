# Setup Ambari clusters using Vagrant

## Requirements

Vagrant version used on this project: `1.6.3`

Vagrant plugins:

```
vagrant plugin install vagrant-butcher
vagrant plugin install vagrant-berkshelf --plugin-version '>= 2.0.1'
vagrant plugin install vagrant-omnibus
```

Cookbooks: `ohai` and `ambari`. See `Berksfile` for details

## Spin up servers

Currently supports digital ocean
