class collector_package {$source, $ensure='installed') {
  file {'/files/vityl-collector-2.11.0-1.el7.x86_64.rpm': source => $source }
    package { 'vityl-collector-2.11.0-1.el7.x86_64.rpm':
    ensure => $ensure,
    provider => 'rpm',
    source => 'puppet:///modules/files/vityl-collector-2.11.0-1.el7.x86_64.rpm',
    required => File['puppet:///modules/files/vityl-collector-2.11.0-1.el7.x86_64.rpm'],
    }
  }
  file {'puppet:///modules/files/vityl-collector-2.11.0.exe': source => $source }
    package { 'vityl-collector-2.11.0.exe':
    ensure => $ensure,
    source => 'puppet:///modules/files/$name.rpm',
    required => File['puppet:///modules/files/vityl-collector-2.11.0.exe'],
#    install_options => ['/VERYSILENT','','']
  }
}
