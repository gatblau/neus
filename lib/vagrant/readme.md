Vagrant VMs
===========

The [Vagrantfile](Vagrantfile) is used to spin up local *vagrant* virtual machines for provisioning the CI Tools onto.  The [config.yml](config.yml) file contains the parameters for each VM.  The number of VMs created is controlled by `hosts`.  Hosts that are not required are commented out.

The script requires an ssh key for the `vagrant` user held in a folder `../keys/vagrant.key`.  This file is a copy of `id_rsa.pub` that is created as follows:

- start up a Vagrant CentOS 7 box
- ssh onto the Vagrant box as the `vagrant` user
- generate an ssh key (no passphrase)
- copy the `id_ras.pub` file to the `keys` folder and rename it `vagrant.key`
- copy the generated `id_rsa` and `id_rsa.pub` files to the `.ssh` folder of the user that runs the Ansible scripts
- destroy the Vagrant box

When the `Vagrantfile` is used to create VMs for CI Tools, they will have ssh keys set up so that the Ansible scripts will run without using passwords to connect.

Note: you may need to ssh onto the Vagrant boxes first to store their ECDSA keys.
