class vitylcollectorUpdate {

  if $osfamily == 'CentOS' {
    package { 'vityl-collectorUpdate-linux':
#    owner => 'Administrator',
#    group => 'Users',
#    mode => '0644',
      provider => 'rpm',
      ensure => installed,
      source => '/opt/vityl/boot/vityl-collector-2.11.0-1.el7.x86_64.rpm', #Point this to the location of the upgrade collector file
      install_options => ['--upgrade'],
    } # package { 'vityl-collectorUpgrade-linux':
   
#    file { '//etc/puppetlabs/code/environments/production/files/createguid.sh':
#      ensure => present,
#      source => '//etc/puppetlabs/code/environments/production/files/createguid.sh',
#      mode   => '0644',
#      owner  => 'root',
#      group  => 'root',
#    }
   
  } #   if $osfamily == 'CentOS' 
  
  if $osfamily == 'Windows' {
   package { 'vityl-collectorUpdate-windows':
      ensure => installed,
      source => '/opt/vityl/boot/vityl-collector-2.11.0.exe',  # Point this to the location of the upgrade collector file
      install_options => ['/exenoui /qn /l*v install.log'],
    }  # package { 'vityl-collectorUpdate-windows':

#    exec { 'guid_update' : 
#       command => 'setx -m VCM_GUID_TYPE "$Env:COMPUTERNAME;"', 
#    }  # exec

    exec { 'start_service' : 
       command => 'sc config vitylcollector start= auto', 
    }  # exec
    
  }  # if $osfamily == 'Windows' 
}


}
