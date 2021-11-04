class profile::centos7_node {
  host {'db.puppet.vm':
    ensure  => present,
    ip      => '192.168.1.131',
  }
}
