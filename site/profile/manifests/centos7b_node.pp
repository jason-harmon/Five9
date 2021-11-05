define fileserver_package($source, $ensure='installed') {
  file { '/files/collectors/$name.rpm': source => $source }
  package { $name:
    ensure => $ensure,
    provider => 'rpm',
    source => '/files/collectors/$name.rpm',
    require => File['/files/collectors/$name.rpm'],
  }
}
