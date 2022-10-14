class common_modules {
  file { '/etc/puppetlabs/code/environments/production/modules/':
    ensure => 'link',
    target => '/data/repos/CaC-example/modules',
  }
}

