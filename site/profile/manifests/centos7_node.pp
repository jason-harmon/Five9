class profile::centos7_node {
  #  Installing Collector Package
  package { "collector":
    ensure=> "present",
   }
    
   #Configuration files
  file {"
    
  ensure  => present,
    ip      => '192.168.1.131',
  }
}
