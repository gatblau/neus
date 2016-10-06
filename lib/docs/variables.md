# Group Variables and Host Variables

Not all variables defined in the group and host variables files are listed below.

## CI Tools

Some of the following variables are only applicable to silver or gold blueprints.  Note: see the `upv_ec2.yml` file for AWS EC2 options.

### Group Variables

#### All

| parameter | required | default | choices | comments |
|--------|--------|--------|--------|--------|
| ansible_port | yes | 22  |  | The Ansible ssh port. |
| jenkins_port | yes | 8080 |  | Default port used by Jenkins. |
| database_port | yes | 3306 |  | Default port used by MariaDB. |
| nexus_port | yes | 8081 |  | Default port used by Nexus. |
| gogs_port | yes | 3000 |  | Default port used by GOGS. |
| sonar_port | yes | 9000 |  | Default port used by SonarQube. |
| pamm_app_port | yes | 8080 |  | Default port used by the PAMM application on the integration test environment. |
| pamm_test_port | yes | 8081 |  | Default port used by the PAMM test application on the integration test environment. |
| selenium_port | yes | 4444 |  | Default port used by Selenium when running the PAMM tests. |
| proxy_ip_address | no |   |  | If running behind a proxy set its IP address. |
| proxy_port | no |   |  | If running behind a proxy set its port number. |
| no_proxy_host | no |   |  | Host name patterns that should not go through the Jenkins proxy set up. |
| pamm | yes | no | <ul><li>yes</li><li>no</li></ul> | When set to `yes` the PAMM seed will be imported into GOGS and a build job will be created in Jenkins to build the PAMM seed. |
| jamm | yes | no | <ul><li>yes</li><li>no</li></ul> | Not yet available. |

#### CI

| parameter | required | default | choices | comments |
|--------|--------|--------|--------|--------|
| scm | | gogs | <ul><li>gogs</li><li>rtc</li></ul> | flags the type of source control to use:<ul><li>gogs: for local Go Git Repository</li><li>rtc: for an external connection to Rational Team Concert</li></ul> |


### Host Variables

#### Localhost

| parameter | required | default | choices | comments |
|--------|--------|--------|--------|--------|
| tgt_platform | yes | docker | <ul><li>docker</li><li>vm</li><li>ec2</li></ul> | docker: uses Docker containers to test the build scripts <br> vm: deploys to VMs, if a password is required, then set `ask_pass` to `True` in `ansible.cfg` <br> ec2: deploys to Amazon Web Services (AWS) Elastic Cloud Compute (EC2) |
| ci_a_ip | when tgt_platform is *vm* | | | Set to the IP address of the VM for ci-a. |
| ci_b_ip | when tgt_platform is *vm* | | | Set to the IP address of the VM for ci-b.  To use one VM for the CI tools environment, set to `{{ci_a_ip}}` . |
| ci_dit_ip | when tgt_platform is *vm* | | | Set to the IP address of the VM for ci-dit |
| ci_c_ip | when tgt_platform is *vm* | | | Only available in `silver` or `gold` blueprints; set to the IP address of the VM for ci-c |
| ci_d_ip | when tgt_platform is *vm* | | | Only available in `gold` blueprint; set to the IP address of the VM for ci-d |
| ci_e_ip | when tgt_platform is *vm* | | | Only available in `gold` blueprint; set to the IP address of the VM for ci-e |
| ci_a_int_dns_name | when tgt_platform is *vm* | ci_a_ip | | If using internal DNS names, holds the ci-a DNS name. |
| ci_b_int_dns_name | when tgt_platform is *vm* | ci_b_ip | | If using internal DNS names, holds the ci-b DNS name. |
| ci_dit_int_dns_name | when tgt_platform is *vm* | ci_dit_ip | | If using internal DNS names, holds the ci-dit DNS name. |
| ci_a_ext_dns_name | when tgt_platform is *vm* | ci_a_ip | | If using external DNS names, holds the ci-a DNS name. |





### Inventory Variables

Although variables are not normally defined in the inventory, the following variable is specific to the inventory of each blueprint.

| parameter | required | default | choices | comments |
|--------|--------|--------|--------|--------|
| blueprint | yes | | <li>bronze</li><li>silver</li><li>gold</li> | Set to blueprint, do not change the value. |


#### PAMM

The following variables are held in the PAMM inventory.txt file but will be refactored to group and host variables files.

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




