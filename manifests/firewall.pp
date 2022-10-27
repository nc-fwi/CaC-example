class common_firewall {
  # https://forge.puppet.com/modules/puppetlabs/firewall
  include 'my_fw::pre'
  include 'my_fw::post'

  Firewall {
    before  => Class['my_fw::post'],
    require => Class['my_fw::pre'],
  }

  class { 'firewall': }

  firewallchain { 'INPUT:filter:IPv4':
    purge   => true,
    ensure  => present,
    policy  => accept,
    before  => undef,
  }

  firewallchain { 'FORWARD:filter:IPv4':
    purge   => true,
    ensure  => present,
    policy  => accept,
    before  => undef,
  }

  firewallchain { 'OUTPUT:filter:IPv4':
    purge   => true,
    ensure  => present,
    policy  => accept,
    before  => undef,
  }
}

class my_fw::pre {
  Firewall {
    require => undef,
  }

  # Default firewall rules
  firewall { '000 accept all icmp':
    proto  => 'icmp',
    action => 'accept',
  } ->
  firewall { '001 accept all to lo interface':
    proto   => 'all',
    iniface => 'lo',
    action  => 'accept',
  } ->
  firewall { '002 reject local traffic not on loopback interface':
    iniface     => '! lo',
    proto       => 'all',
    destination => '127.0.0.1/8',
    action      => 'reject',
  } ->
  firewall { '003 accept related established rules':
    proto  => 'all',
    state  => ['RELATED', 'ESTABLISHED'],
    action => 'accept',
  }
  firewall { '004 Allow inbound SSH':
    dport    => 22,
    proto    => 'tcp',
    action   => 'accept',
  }
}

class my_fw::post {
  firewall { '999 drop all':
    proto  => 'all',
    action => 'drop',
    before => undef,
  }
}