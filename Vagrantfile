servers=[
  {
    :hostname => "web01",
    :ip => "192.168.56.10",
    :box => "almalinux/8",
    :ram => 1024,
    :cpu => 2
  },
  {
    :hostname => "db01",
    :ip => "192.168.56.11",
    :box => "almalinux/8",
    :ram => 2048,
    :cpu => 4
  },
  {
    :hostname => "dns01",
    :ip => "192.168.56.12",
    :box => "almalinux/8",
    :ram => 2048,
    :cpu => 4
  }
]

Vagrant.configure(2) do |config|
    servers.each do |machine|
        config.vm.define machine[:hostname] do |node|
            node.vm.box = machine[:box]

            # Set hostname
            node.vm.hostname = "#{machine[:hostname]}.example.com"

            # Disabled because it didn't work with ansible playbook
            #node.vm.network "private_network", ip: machine[:ip]

            # Dont mount host folder into vm
            node.vm.synced_folder '.', '/vagrant', disabled: true
            node.ssh.insert_key = false
            node.vm.provider "virtualbox" do |vb|
                vb.gui = false
                vb.cpus = machine[:cpu]
                vb.memory = machine[:ram]
                #vb.customize ["modifyvm", :id, "--memory", machine[:ram]]
                # Fix dns not working
                vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
            end
            # Run script inside vm upon completion
            #node.vm.provision "shell", inline: <<-SHELL
            #  # Enable puppet repo
            #  sudo rpm -Uvh https://yum.puppet.com/puppet7-release-el-8.noarch.rpm

            #  # Install puppet, git and nano
            #  yum install puppet-agent git nano -y
            #SHELL
            end
        end
        config.vm.provision "ansible" do |ansible|
            ansible.playbook = "init.yml"
        end
    end
