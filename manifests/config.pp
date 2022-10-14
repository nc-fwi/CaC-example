# Web nodes
node /^web\d+.example.com$/ {
  include 'common_settings'
  include 'common_firewall'
  #include 'nginx'
  #include 'dns-client'
}

# dns nodes
node /^dns\d+.example.com$/ {
  include 'common_settings'
  #include 'dns-server'
}

# database nodes
node /^db\d+.example.com$/ {
  include 'common_settings'
  #include 'dns-client'
}
