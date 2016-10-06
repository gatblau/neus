## Getting Started

This guide assumes that the [Europa](http://github.com/gatblau/europa) development environment is used to build the Neus code.

### Clone Neus Project

Once the Europa environment is running, clone the Neus code as follows:

1. Run Intellij Idea Community Edition

2. In the IntelliJ pop-up windows, select `Project from version control` followed by `GitHub`

3. Enter your GitHub account details

4. If required, enter a master password (optional)

5. Enter the following:

    a) Neus URL: http://github.com/gatblau/neus

    b) Click on `Clone` to clone into IntelliJ

6. Click on `Yes` to create IntelliJ project.

7. Select defaults by clicking `Next` three times, then click on `Finish`.

### Neus Blueprints

Each toolset is divided into blueprints; *bronze*, *silver*, *gold* or *silicon*.  The bronze blueprint folder contains the following files:

| File | Description |
|--------|--------|
| inventory.txt | The inventory file. |
| playbook.yml | This is the [playbook](http://docs.ansible.com/ansible/playbooks.html) that provisions the toolset.   |
| readme.md | The readme describes the blueprint. |
| upc.yml | This playbook provisions the Docker containers used when testing the build. |
| upv.yml | This playbook is used to add the VM hosts when deploying to VMs. |
| upv_ec2.yml | This playbook is used to provision the AWS EC2 instances when deploying to AWS EC2.  In order to provision to AWS EC2, an [AWS account](aws-ec2.md) is required. |

### Update Build Parameters

Before building the toolset, update the build parameters in the blueprint host_vars/localhost file as follows:

1. Target platform: for testing, select docker
2. If target platform is vm then update the IP Addresses
3. If the target platform is AWS EC2 then update the CI DIT public DNS name.

### Building the Toolset

Open a terminal and cd into the toolset directory.  To build the toolset, run `up.sh` with the blueprint as an argument:

e.g. `up.sh bronze`

If the target platform is `vm` and ssh keys have not been set up, then edit `ansible.cfg` and and set `ask_pass` to `true` so that Ansible will prompt for a password.  Note: if there is more than one VM, then they must all have the same password.

### CI Tools User Guide

See the [user guide](user_guide.md) for details on pre-use checks and how to access and use the CI Tools environment.
