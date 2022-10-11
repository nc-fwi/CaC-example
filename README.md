This guide is for setting up a PoC concept for CaC.


# Prepare windows host

For running the VM we will be using virtualbox (v6.1)

Vagrant will be used to setup a code defined virtual machine.

## Virtualbox installation

[VirtualBox Download 6.1](https://www.virtualbox.org/wiki/Download_Old_Builds_6_1)

## Vagrant installation

[Vagrant Download](https://www.vagrantup.com/downloads)

# Run VM

Command used to generate Vagrantfile `vagrant init almalinux/8`

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