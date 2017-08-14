CI Tools
========

CI Tools can be built as a complete set of CI tools using the `site.yml` file or each tool can be deployed individually using the following playbooks:

| Site File | Provisions |
|----------|----------|
| site_build.yml | Jenkins build server |
| site_quality.yml | SonarQube code quality using MariaDB database |
| site_repo.yml | Nexus repository |
| site_source.yml | GOGS server using MariaDB database |

The [site.yml](site.yml) playbook is used for provisioning a complete CI environment. Provisioning of the tools is controlled by inventory files, one for each blueprint, with each tool provisioned on a specified host as shown below:

| Blueprint | Build | Repo | Database | Source | Quality | Chat | Build Slave(s) |
|----------|----------|----------|----------|----------|----------|----------|----------|
| [basic](inventories/basic) | ci-a | ci-a |ci-a | ci-a | ci-a | ci-a | none |
| [bronze](inventories/bronze) | ci-a | ci-a | ci-b | ci-b | ci-b | ci-a | none |
| [silver](inventories/silver) | ci-a | ci-a | ci-b | ci-b | ci-b | ci-a | ci-c ci-d |
| [gold](inventories/gold) | ci-a | ci-a | ci-d | ci-e | ci-e | ci-a | ci-b ci-c |

The [silicon](inventories/silicon) blueprint provisions each tool in a single container and creates Docker images for use in an Orchestration tool such as OpenShift.

Site Playbook
=============

The [site.yml](site.yml) is the main playbook for provisioning tools.  It provisions the tools as follows:

| Step | Tag(s) | Description |
|------------|------------|------------|
| Initialise hosts: [up_host](../lib/roles/up_host/main.yml) | always | The playbook determines the target platform (Docker, VM or cloud) and sets up the hosts for provisioning. |
| Provision Build Server | build, always | This step sets up the user for Jenkins, installs Jenkins and then configures Jenkins. |
| Provision Build Tools | build, basic, bronze, silver, gold | This step installs the build tools for Jenkins and, optionally, installs the PAMM seed dependencies and build pipeline. |
| Provision PAMM Jenkins slaves | pamm, pamm-slaves, silver, gold | This step sets up one or more hosts as a Jenkins slave with, optionally, PAMM seed dependencies. |
| Provision JAMM Jenkins Slaves | jamm, jamm-slaves, silver, gold | This step sets up one or more hosts as a Jenkins slave with, optionally, JAMM dependencies. |
| Provision Artefact Repository | repo, always | This step installs and configures Nexus. |
| Provision Database | database, always | This step installs and configures MariaDB and, if selected, sets up databases for GOGS and Sonar. |
| Provision Quality Server | quality, always | This step installs and configures SonarQube. |
| Provision Chat Server | chat, basic, bronze, silver, gold | This step installs Let's Chat. |
| Provision PAMM DIT Host | pamm, pamm-dit, basic, bronze, silver, gold | This step provisions a development, integration test (DIT) host for PAMM. |
| Provision JAMM DIT Host | jamm, jamm-dit, basic, bronze, silver, gold | This step provisions a development, integration test (DIT) host for JAMM.
| Provision Source Repository | source, always | This step installs GOGS and, optionally, imports the PAMM seed repository. |
| Provision Jenkins Builder | silicon | This step installs build tools for use with Jenkins in a containerised environment. |
| Create Docker Images | silicon | This step creates Docker images for use with an Orchestration engine such as OpenShift. |

Provisioning is mostly carried out using roles, except for the last step which is a task carried out on the control node (`localhost`).

Provisioning
============

Originally, provisioning of CI Tools was controlled by a variable called `blueprint`.  This is still used within roles, but the [site.yml](site.yml) file now uses tags to control provisioning with the `blueprint` variable used to control provisioning within [roles](#roles).  This gives flexibility in provisioning a full or partial CI Tools environment.  The tools are controlled using the following tags:

| Tool | Tag(s) |
|----------|----------|
| Jenkins | build |
| Nexus | repo |
| MariaDB | database |
| GOGS | source |
| Sonar | quality |
| PAMM seed | pamm |
| PAMM DIT | pamm, pamm-dit |
| JAMM| jamm |
| JAMM DIT | jamm, jam-dit |

Provisioning of CI Tools is carried out using the [up.sh](up.sh) shell script with two or three arguments:

1. The first argument is the blueprint tag and inventory
2. The second argument is the blueprint variable passed using `--extra-vars`
3. The third argument is the tags to skip passed using `--skip-tags`

The `up.sh` script will run the [fetch.sh](fetch.sh) to download rpm and zip files required to provision the CI Tools.  It will then provision CI Tools using the following command:

`ansible-playbook -i inventories/$1 site.yml --tags=$1 --extra-vars "blueprint=$2" --skip-tags=$3 | tee citools.log`

Using tags allows flexibiliy in provisioning the CI Tools environment.  If, for example, only GOGS was required it could be provisioned to a single host using the following command:

`sh up.sh basic basic build,repo,quality,pamm,jamm` 

Note: GOGS requires MariaDB so `database` is not included as a skipped tag.

There are variables that need to be set up before provisioning the environment.  See the [variables readme](../lib/docs/variables.md) for details.

Roles<a name="roles"></a>
=====

Each tool is provisioned using roles.  A list of roles used for each tool is shown below:

| Tool | Roles |
|----------|----------|
| build | <li>jenkins_user</li> <li>jenkins_install</li> <li>jenkins_master</li> <li>jenkins_build_tools</li> <li>jenkins_browsers</li> <li>jenkins_pammy_dependencies</li> <li>jenkins_pammy_pipeline</li> |
| repo | <li>nexus_install</li> <li>nexus</li>  |
| database | <li>mariadb_install</li> <li>mariadb</li> |
| quality | <li>sonar_install</li> <li>sonar</li> |
| source | <li>gogs_install</li> <li>gogs_import_pammy</li> |
| chat | <li>baseline</li> <li>mongodb_install</li> <li>lets_chat</li> |

Some of the roles are conditional ( see [site.yml](site.yml)) e.g. if the variable `pamm` is set to no then the PAMM roles will not be run.  Roles which are specific to CI Tools can be found in the `citools/roles` folder.  Roles which are generic can be found in the `lib/roles` folder.
