This guide is for setting up a PoC concept for CaC.


# Prepare windows host

For running the VM we will be using virtualbox (v6.1)

Vagrant will be used to setup a code defined virtual machine.

## Virtualbox installation

[VirtualBox Download 6.1](https://www.virtualbox.org/wiki/Download_Old_Builds_6_1)

## Vagrant installation

[Vagrant Download](https://www.vagrantup.com/downloads)

# Run VM

A Vagrantfile has been configured to create 3 vm: web01, dns01 and db01.

Run the vm:

```
vagrant up --provider=virtualbox

vagrant ssh-config > vagrant-ssh
ssh -F vagrant-ssh default
```

## reload vm

```
vagrant reload 
vagrant reload --provision
vagrant provision
```

## Destroy vm

```
vagrant destroy default
```

# Puppet

## Modules

Install a module

```
git submodule add https://github.com/voxpupuli/puppet-firewalld modules/puppet-firewalld

git rm modules/puppet-firewalld
```

Remove a module

```
git rm --cached modules/puppet-firewalld
rm -rf modules/puppet-firewalld
```

Delete entry in .gitmodules

```
[submodule "modules/puppet-firewalld"]
	path = modules/puppet-firewalld
	url = https://github.com/voxpupuli/puppet-firewalld
```

Delete entry in .git/config

```
[submodule "modules/puppet-firewalld"]
        url = https://github.com/voxpupuli/puppet-firewalld
        active = true
```

Delete module in .git

```
rm -rf .git/modules/modules/puppet-firewalld/
```