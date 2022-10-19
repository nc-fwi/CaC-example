class local_accounts {
  group { 'admins_local':
    gid => '6500'
  }
  group { 'users_local':
    gid => '6700'
  }

  account { 'user':
    id => '1500',
    sshkey  => true,
    group   => 'admins_local'
  }


  #if($facts['fqdn'] == 'web01.example.com') {
  #
  #}

}

define account (
  String $id,
  Boolean $sshkey,
  String $group = 'users_local'
) {
  $user = $title

  user { $user:
    uid       => $id,
    ensure    => present,
    password  => '!',
    groups    =>  $group,
    shell     => '/bin/bash',
    require   => Group['users_local', 'admins_local']
  }

  file { "/home/$user":
    ensure  => 'directory',
    owner   => $user,
    group   => $user,
    mode    => '740',
    seltype => 'user_home_dir_t',
    require => User[$user],
  }

  if $sshkey {
    file { "/home/$user/.ssh":
      ensure  => 'directory',
      owner   => $user,
      group   => $user,
      mode    => '0400',
      seltype => 'ssh_home_t',
      require => File["/home/$user"]
    }

    file { "/home/$user/.ssh/authorized_keys":
      ensure  => 'file',
      owner   => $user,
      group   => $user,
      mode    => '0400',
      seltype => 'ssh_home_t',
      source  => "/etc/puppetlabs/code/environments/production/files/ssh_keys/id_rsa_pub_$user",
      require => File["/home/$user/.ssh"]
    }
  }
}

define remove_account {
  $user = $title
  user { $user:
    ensure  => absent,
  }
  file { "/home/$user":
    ensure  => absent,
    force   => true
  }
}