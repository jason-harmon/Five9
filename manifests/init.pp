class collector_package {$source, $ensure='installed') {
  file {'/files/vityl-collector-2.11.0-1.el7.x86_64.rpm': source => $source }
  package { $name:
    ensure => $ensure,
    provider => 'rpm',
    source => '/files/$name.rpm',
    required => File['/files/$name.rpm']
  }
}
