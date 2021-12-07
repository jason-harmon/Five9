class vitylcollectorInstall {
  $kafka_atl = '127.0.0.1'
  $kafka_scl = '127.0.0.1'
  #$ipaddr_anyother = '127.0.0.1'
  $hostname = $facts['fqdn']
  
  if $osfamily == 'CentOS' {
    package { 'vityl-collector-linux':
#    owner => 'Administrator',
#    group => 'Users',
#    mode => '0644',
      provider => 'rpm',
      ensure => installed,
      source => '/opt/vityl/boot/vityl-collector-2.11.0-1.el7.x86_64.rpm',
      install_options => ['--install'],
    } # package { 'vityl-collector-linux':
   
    file { '//etc/puppetlabs/code/environments/production/files/createguid.sh':
      ensure => present,
      source => '//etc/puppetlabs/code/environments/production/files/createguid.sh',
      mode   => '0644',
      owner  => 'root',
      group  => 'root',
    }
   
  if $hostname[0,3] == 'ATL' {
  file_line { 'atl_kafka':
    ensure => present,
    path   => '/etc/vityl/collector/zookeeper.properties',
    match  => 'ZooKeeperConnectionString=127.0.0.1:2181',
    line   => 'ZooKeeperConnectionString=${kafka_atl}:2181',
  } elseif $hostname[0,3] == 'SLC' {
	  file_line { 'slc_kafka':
		  ensure => present,
		  path   => '/etc/vityl/collector/zookeeper.properties',
		  match  => 'ZooKeeperConnectionString=127.0.0.1:2181',
		  line   => 'ZooKeeperConnectionString=${kafka_scl}:2181',
  } else {  }  # else
   
  } #   if $osfamily == 'CentOS' 
  
  if $osfamily == 'Windows' {
    package { 'vityl-collector-windows':
      ensure => installed,
      source => '/opt/vityl/boot/vityl-collector-2.11.0.exe',
      install_options => ['/exenoui /qn /l*v install.log'],
    }  # package { 'vityl-collector-windows':

    exec { 'guid_update' : 
       command => 'setx -m VCM_GUID_TYPE "host"', 
    }  # exec

    exec { 'start_service' : 
       command => 'sc config vitylcollector start= auto', 
    }  # exec
    
   if $hostname[0,3] == 'ATL' {
    file_line { 'atl_kafka':
      ensure => present,
      path   => 'C:\ProgramData\Vityl\Collector\zookeeper.properties',
      match  => 'ZooKeeperConnectionString=127.0.0.1:2181',
      line   => 'ZooKeeperConnectionString=${kafka_atl}:2181',
    } elseif $hostname[0,3] == 'SLC' {
	  file_line { 'slc_kafka':
		  ensure => present,
		  path   => 'C:\ProgramData\Vityl\Collector\zookeeper.properties',
		  match  => 'ZooKeeperConnectionString=127.0.0.1:2181',
		  line   => 'ZooKeeperConnectionString=${kafka_scl}:2181',
    } else {  }  # else 
    
  }  # if $osfamily == 'Windows' 
}
