class profile::centos7_node {
  #  Installing Collector Package
  package{'vityl-collector-2.11.0-1.el7.x86_64.rpm':
            provider => 'rpm',
            ensure => 'present',
            source => 'puppet:///files/collector/linux/vityl-collector-2.11.0-1.el7.x86_64.rpm',
         }
}
