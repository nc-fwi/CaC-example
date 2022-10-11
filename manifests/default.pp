class common_settings {
    cron { 'puppet_apply':
      ensure  => 'present',
      command => '/opt/puppetlabs/bin/puppet apply /data/repos/CaC-example/manifests',
      user    => root,
      minute  => '*/15',
    }

    cron { 'git_clone':
      ensure  => 'present',
      command => 'cd /data/repos/CaC-example && git reset --hard && git pull',
      user    => root,
      minute  => '*/10',
    }
}
