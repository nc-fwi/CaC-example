class nginx_server {
  include 'nginx'
  nginx::resource::server { 'website.example.com':
    www_root => '/data/website',
  }

  file { '/data/website':
    ensure  => 'directory',
    owner   => 'nginx',
    group   => 'nginx',
    mode    => '0644',
    seltype => 'httpd_sys_content_t',
    source  => '/etc/puppetlabs/code/environments/production/files/website',
    recurse => 'remote',
    purge   => true,
    require => File['/data']
  }

  firewall { '020 Allow inbound HTTP':
    dport    => 80,
    proto    => 'tcp',
    action   => 'accept',
  }
}