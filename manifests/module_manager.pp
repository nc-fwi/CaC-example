class module_manager {

  $modules = {
    puppetlabs-firewall => '3.6.0',
    puppet-chrony       => '2.5.0',
    thias-bind          => '0.5.5'
  }

  $modules.each |$module, $version| {
    exec { "Installing module $module version $version":
      command => "/opt/puppetlabs/bin/puppet module install $module --version $version",
      unless  => "/opt/puppetlabs/bin/puppet module list | grep '$module' | grep '$version'",
      returns => ['0', '2'] # List of success exit codes, when new module is installed it returns 2
    }
  }

}

