name "ambari_agent"
description "Ambari agent"
run_list "recipe[ohai]", "recipe[ambari::agent]"
default_attributes ({})
