class collector_package {$source, $ensure='installed') {
  file {'puppet:///files/vityl-collector-2.11.0-1.el7.x86_64.rpm': source => $source }
    package { 'vityl-collector-2.11.0-1.el7.x86_64.rpm':
    ensure => $ensure,
#    owner => 'Administrator',
#    group => 'Users',
#    mode => '0644',
    provider => 'rpm',
    source => 'puppet:///files/vityl-collector-2.11.0-1.el7.x86_64.rpm',
    required => File['puppet:///files/vityl-collector-2.11.0-1.el7.x86_64.rpm'],
    }
  }
  file {'puppet:///files/vityl-collector-2.11.0.exe': source => $source }
    package { 'vityl-collector-2.11.0.exe':
    ensure => $ensure,
    source => 'puppet:///files/$name.rpm',
    required => File['puppet:///files/vityl-collector-2.11.0.exe'],
#    install_options => ['/VERYSILENT','','']
  }
}
