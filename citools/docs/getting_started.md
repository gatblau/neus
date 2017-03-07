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

Each toolset is divided into blueprints; *basic*, *bronze*, *silver*, *gold* or *silicon*.  The `citools` folder contains the following items:

| File | Description |
|--------|--------|
| cache | Folder to hold downloaded installation files. |
| docs | Diagrams of each blueprint. |
| group_vars | Ansible [group_variables](http://docs.ansible.com/ansible/playbooks_best_practices.html#group-and-host-variables). |
| host_vars | Ansible [host_variables](http://docs.ansible.com/ansible/playbooks_best_practices.html#group-and-host-variables). |
| inventories | A folder containing [inventory](http://docs.ansible.com/ansible/intro_inventory.html) files named after each blueprint. |
| roles | This folder contains [roles](http://docs.ansible.com/ansible/playbooks_roles.html) specific to CI Tools. |
| site.yml | This is the [playbook](http://docs.ansible.com/ansible/playbooks.html) that provisions the toolset.   |
| readme.md | The CI Tools readme file. |
| upc.yml | This playbook provisions the Docker containers used when testing the build. |
| upv.yml | This playbook is used to add the VM hosts to the inventory, dynamically, when deploying to VMs. |
| upv_ec2.yml | This playbook is used to provision the AWS EC2 instances when deploying to AWS EC2.  In order to provision to AWS EC2, an [AWS account](aws-ec2.md) is required. |

### Update Build Parameters

Before building the toolset, update the build parameters in the blueprint host_vars/localhost file as follows:

1. Target platform: for testing, select docker
2. If target platform is vm then update the IP Addresses
3. If the target platform is AWS EC2 then update the CI DIT public DNS name.

### Build Tags

CI Tools is tagged so that provisioning of the tools can be controlled.  Tags specified in [site.yml](site.yml) are:

| Blueprint Tag | Description |
| ----------|----------|
| basic | Used to build the `basic` blueprint. |
| bronze | Used to build the `bronze` blueprint. |
| silver | Used to build the `silver` blueprint. |
| gold | Used to build the `gold` blueprint. |
| silicon | Used to build the `silicon` blueprint. |

| Tool Tag | Description |
| ----------|----------|
| build | Used to exclude the build tool (Jenkins) from the build. |
| database | Used to exclude the database tool (MariaDB) from the build.  Note: this is required for GOGS and SonarQube, so do not exclude if provisioning either of these tools. |
| repo | Used to exclude the repository tool (Nexus) from the build. |
| quality | Used to exclude the quality tool (SonarQube) from the build. |
| source | Used to exclude the build tool (GOGS) from the build. |
| pamm-slaves | Used to exclude provisioning of the PAMM slaves. |
| jamm-slaves | Used to exclude provisioning of the JAMM slaves. |
| pamm-dit | Used to exclude provisioning of the PAMM DIT. |
| jamm-dit | Used to exclude provisioning of the JAMM DIT. |
| pamm | Used to exclude provsioning of the PAMM slaves and DIT. |
| jamm | Used to exclude provsioning of the JAMM slaves and DIT. |

For example, if you just want to provision a single VM with GOGS on it, you would use the following command:

`sh up.sh basic basic build,quality,repo,pamm,jamm`

### Building the Toolset

Open a terminal and cd into the toolset directory.  To build the toolset, run `up.sh` with a tag and blueprint as arguments (note a third argument can be used to skip parts of the build):

e.g. `up.sh bronze bronze`

If the target platform is `vm` and ssh keys have not been set up, then edit `ansible.cfg` and and set `ask_pass` to `true` so that Ansible will prompt for a password.  Note: if there is more than one VM, then they must all have the same password.

### CI Tools User Guide

See the [user guide](user_guide.md) for details on pre-use checks and how to access and use the CI Tools environment.
