class collector_package {$source, $ensure='installed') {
  file {'/files/vityl-collector-2.11.0-1.el7.x86_64.rpm': source => $source }
    package { 'vityl-collector-2.11.0-1.el7.x86_64.rpm':
    ensure => $ensure,
    provider => 'rpm',
    source => '/files/vityl-collector-2.11.0-1.el7.x86_64.rpm',
    required => File['/files/vityl-collector-2.11.0-1.el7.x86_64.rpm'],
    }
  }
  file {'/files/vityl-collector-2.11.0.exe': source => $source }
    package { 'vityl-collector-2.11.0.exe':
    ensure => installed,
    provider => 'rpm',
    source => '/files/$name.rpm',
    required => File['/files/vityl-collector-2.11.0.exe'],
#    install_options => ['/VERYSILENT','','']
  }
}
