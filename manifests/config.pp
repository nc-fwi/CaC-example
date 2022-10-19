# Web nodes
node /^web\d+.example.com$/ {
  include 'module_manager'
  include 'common_settings'
  include 'common_firewall'
  include 'dns_client'
}

# dns nodes
node /^dns\d+.example.com$/ {
  include 'module_manager'
  include 'common_settings'
  include 'common_firewall'
  include 'dns_server'
}

# database nodes
node /^db\d+.example.com$/ {
  include 'module_manager'
  include 'common_settings'
  include 'common_firewall'
  include 'dns_client'
}
