### Inventory File

The Ansible inventory is described [here](http://docs.ansible.com/ansible/intro_inventory.html).

For Neus, the inventory contains the following options:

#### CI Tools

Below is a list of options in the CI Tools inventory files.  Some of the options are only applicable to silver of gold blueprints.

| parameter | required | default | choices | comments |
|--------|--------|--------|--------|--------|
| ansible_port | yes | 22  |  | The Ansible ssh port. |
| jenkins_port | yes | 8080 |  | Default port used by Jenkins. |
| database_port | yes | 3306 |  | Default port used by MariaDB. |
| nexus_port | yes | 8081 |  | Default port used by Nexus. |
| gogs_port | yes | 3000 |  | Default port used by GOGS. |
| sonar_port | yes | 9000 |  | Default port used by SonarQube. |
| tgt_platform | yes | docker | <ul><li>docker</li><li>vm</li><li>ec2</li></ul> | docker: uses Docker containers to test the build scripts <br> vm: deploys to VMs, also use `-k` with `up.sh` to ask for password <br> ec2: deploys to Amazon Web Services (AWS) Elastic Cloud Compute (EC2) |
| ci_a_ip | when tgt_platform is *vm* | | | Set to the IP address of the VM for ci-a |
| ci_b_ip | when tgt_platform is *vm* | | | Set to the IP address of the VM for ci-b |
| ci_dit_ip | when tgt_platform is *vm* | | | Set to the IP address of the VM for ci-dit |
| ci_c_ip | when tgt_platform is *vm* | | | Only available in `silver` or `gold` blueprints; set to the IP address of the VM for ci-c |
| ci_d_ip | when tgt_platform is *vm* | | | Only available in `gold` blueprint; set to the IP address of the VM for ci-d |
| ci_e_ip | when tgt_platform is *vm* | | | Only available in `gold` blueprint; set to the IP address of the VM for ci-e |
| pamm | yes | no | <ul><li>yes</li><li>no</li></ul> | When set to `yes` the PAMM seed will be imported into GOGS and a build job will be created in Jenkins to build the PAMM seed. |
| jamm | yes | no | <ul><li>yes</li><li>no</li></ul> | Not yet available. |
| scm | | gogs | <ul><li>gogs</li><li>rtc</li></ul> | flags the type of source control to use:<ul><li>gogs: for local Go Git Repository</li><li>rtc: for an external connection to Rational Team Concert</li></ul> |
| blueprint | yes | | <li>bronze</li><li>silver</li><li>gold</li> | Set to blueprint, do not change the value. |
| database_host | yes | | | Set according to the blueprint.  Do not change the value. |
| gogs_host | yes | | | Set according to the blueprint.  Do not change the value. |
| sonar_host | yes | | | Set according to the blueprint.  Do not change the value. |

#### PAMM

| parameter | required | default | choices | comments |
|--------|--------|--------|--------|--------|
| tgt_platform | yes | docker | <ul><li>docker</li><li>vm</li><li>ec2</li></ul> | docker: uses Docker containers to test the build scripts <br> vm: deploys to VMs, also use `-k` with `up.sh` to ask for password <br> ec2: deploys to Amazon Web Services (AWS) Elastic Cloud Compute (EC2) |
| pamm_a_ip | when tgt_platform is *vm* | | | Set to the IP address of the VM for pamm-a |
| instance_type |when tgt_platform is *ec2* | t2.micro | | AWS EC2 instance type. |
| region | when tgt_platform is *ec2* | eu-west-1 | | AWS region. |
| tag_name | when tgt_platform is *ec2* | pamm-a | | EC2 instance tag name. |
| vpc_subnet_id | when tgt_platform is *ec2* | | | Set to AWS account vpc subnet. |
| zone | when tgt_platform is *ec2* | eu-west-1b | | AWS zone. |
| blueprint | yes | | | Set to blueprint, do not change the value. |




