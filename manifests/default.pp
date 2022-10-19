class common_settings {
  include 'common_sshd'

  # Ensure state every day at 1:30
  cron { 'puppet_apply':
    ensure  => 'present',
    command => '/opt/puppetlabs/bin/puppet apply /etc/puppetlabs/code/environments/production/manifests',
    user    => root,
    hour    => ['1'],
    minute  => ['30']
  }

  # Default packages
  package { ['bind-utils', 'nc', 'wget', 'curl']:
    ensure => present,
  }
}

class common_sshd {
  file { '/etc/ssh/sshd_config':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    source  => '/etc/puppetlabs/code/environments/production/files/ssh/sshd_config'
  }
}

class common_ntp {

}