# Web nodes
node /^web\d+.example.com$/ {
  include 'module_manager'
  include 'common_settings'
  include 'dns_client'
  include 'common_firewall'
}

# dns nodes
node /^dns\d+.example.com$/ {
  include 'module_manager'
  include 'common_settings'
  include 'dns_server'
  include 'common_firewall'
}

# database nodes
node /^db\d+.example.com$/ {
  include 'module_manager'
  include 'common_settings'
  include 'dns_client'
  include 'common_firewall'
}
