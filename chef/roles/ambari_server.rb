name "ambari_server"
description "Ambari server"
run_list "recipe[ohai]", "recipe[ambari::server]"
default_attributes ({})
