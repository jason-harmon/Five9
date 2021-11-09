
package { 'vityl-collector':
#    owner => 'Administrator',
#    group => 'Users',
#    mode => '0644',
    provider => 'rpm',
    ensure => installed,
    source => '/etc/puppetlabs/code/environments/production/files/vityl-collector-2.11.0-1.el7.x86_64.rpm',
    install_options => ['--install'],
}
