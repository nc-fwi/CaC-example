class common_settings {
  include 'common_modules'

  # Ensure state every day at 1:30
  cron { 'puppet_apply':
    ensure  => 'present',
    command => '/opt/puppetlabs/bin/puppet apply /etc/puppetlabs/code/environments/production/manifests',
    user    => root,
    hour    => ['1'],
    minute  => ['30']
  }
}
