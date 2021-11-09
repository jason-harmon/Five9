class vitylcollectorInstall {

  if $osfamily == 'CentOS' {
    package { 'vityl-collector-linux':
#    owner => 'Administrator',
#    group => 'Users',
#    mode => '0644',
      provider => 'rpm',
      ensure => installed,
      source => '/etc/puppetlabs/code/environments/production/files/vityl-collector-2.11.0-1.el7.x86_64.rpm',
      install_options => ['--install'],
    }
    
    file { '/etc/puppetlabs/code/environments/production/files/guids/' + $host + '.guid.properites':
       source => '/etc/vityl/collector/guid.properties',
       replace => true,
    }
  }
  
  if $osfamily == 'Windows' {
    package { 'vityl-collector-windows':
      ensure => installed,
      source => '/etc/puppetlabs/code/environments/production/files/vityl-collector-2.11.0.exe',
      install_options => ['/exenoui /qn /l*v install.log'],
    }

    exec { 'start_service' : 
       command => 'sc config vitylcollector start= auto', 
    }
    
    file { 'C:\\puppetlabs\\code\\environments\\production\\files\\guids\\' + $host + '.guid.properites':
       source => '/etc/vityl/collector/guid.properties',
       replace => true,
    }
  }
}
