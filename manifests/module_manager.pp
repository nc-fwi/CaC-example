class common_modules {

  $modules = {
      puppetlabs-firewall  => '3.6.0',
    }

  $modules.each |$module, $version| {
    exec { "Installing module $module version $version":
      command => "/opt/puppetlabs/bin/puppet module install $module --version $version",
      unless  => "/opt/puppetlabs/bin/puppet module list | grep '$module' | grep '$version'"
    }
  }

}

