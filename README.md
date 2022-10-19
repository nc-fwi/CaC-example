This guide is for setting up a PoC concept for CaC.


# Prepare windows host

For running the VM we will be using virtualbox (v6.1)

Vagrant will be used to setup a code defined virtual machine.

## Virtualbox installation

[VirtualBox Download 6.1](https://www.virtualbox.org/wiki/Download_Old_Builds_6_1)

## Vagrant installation

[Vagrant WSL installation](https://thedatabaseme.de/2022/02/20/vagrant-up-running-vagrant-under-wsl2/)

## Ansible installation

```
sudo yum install ansible
```

# Run Vagrant

A Vagrantfile has been configured to create 3 vm: web01, dns01 and db01.

Run the vm's:

```
vagrant up
```

## reload vm's

There are three options:

```
vagrant reload 
vagrant reload --provision
vagrant provision
```

## Destroy vm

This deletes all vm's without confirmation.

```
vagrant destroy -f
```

# Run apply configuration

The inventory file specified here is automatically generated by vagrant

```
ansible-playbook -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory apply.yml
```

# misc

Generate ssh config for vagrant hosts

```
vagrant ssh-config > vagrant-ssh
ssh -F vagrant-ssh default
```