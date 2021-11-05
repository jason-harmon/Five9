define fileserver_package($source, $ensure='installed') {
  file { '/files/$name.rpm': source => $source }
  package { $name:
    ensure => $ensure,
    provider => 'rpm',
    source => '/files/$name.rpm',
    require => File['/files/$name.rpm'],
  }
}
