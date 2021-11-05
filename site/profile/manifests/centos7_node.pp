class profile::centos7_node {
  #  Installing Collector Package
  package { "collector":
    ensure=> "present",
   }
    
   #Installation file
   file {"files/collectors/linux/vityl-collector-2.11.0-1.el7.x86_64.rpm":
     ensure=> "present",
     }
    
}

# Class Declaration
include profile::centos7_node
