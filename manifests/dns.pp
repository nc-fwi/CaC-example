class dns_server {
  # https://forge.puppet.com/modules/thias/bind
  include 'bind'

  bind::server::conf { '/etc/named.conf':
    listen_on_addr    => [ 'any' ],
    listen_on_v6_addr => [ 'any' ],
    forwarders        => [ '8.8.8.8', '8.8.4.4' ],
    allow_query       => [ '0.0.0.0/0' ],
    #allow_query       => [ 'localnets' ],
    zones             => {
      'example.com' => [
        'type master',
        'file "example.com"',
      ]
    }
  }
  bind::server::file { 'example.com':
    source => '/etc/puppetlabs/code/environments/production/files/etc/bind/example.com',
  }

  firewall { '010 Allow inbound DNS':
    dport    => 53,
    proto    => 'tcp',
    action   => 'accept',
  }

  firewall { '011 Allow inbound DNS':
    dport    => 53,
    proto    => 'udp',
    action   => 'accept',
  }
}

class dns_client {
  $nameservers = ['192.168.56.12']

  file { '/etc/resolv.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('/etc/puppetlabs/code/environments/production/files/etc/resolv.conf.erb'),
  }
}