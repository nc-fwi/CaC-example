class common_settings {
  include 'common_sshd'
  include 'local_accounts'
  include 'common_sudoers'

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
    #before => Class['bind']
  }

  file { '/data':
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0644'
  }
}

class common_sshd {
  service { 'sshd':
    ensure => 'running',
    enable => true,
  }

  file { '/etc/ssh/sshd_config':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    source  => '/etc/puppetlabs/code/environments/production/files/etc/ssh/sshd_config',
    notify => Service['sshd'],
  }
}

class common_sudoers {
  file { '/etc/sudoers.d/admins_local':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0440',
    source  => '/etc/puppetlabs/code/environments/production/files/etc/sudoers.d/admins_local'
  }
}