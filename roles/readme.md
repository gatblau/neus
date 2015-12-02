##Roles

[Ansible roles](http://docs.ansible.com/ansible/playbooks_roles.html) are used to select what is to be installed on the virtual machine.  Where a role depends upon another role, the dependent role is installed first (see meta/main.yml for dependant roles.).  

Where two or more roles depends on a role, the dependant role will be installed only once, by the first role that is run that depends on it: e.g. roles a and b depend on role c; if role a runs first, then role c will be installed followed by a; when b is run, it knows that c is already installed so does not install it a second time.

| Role | Description |
|--------|--------|
|artifactory | This role installs the Artifactory repository tool.  It depends upon the mariadb and nginx roles. |
|baseline        |This role installs the EPEL repository. |
|common| This role installs the following common tools: Git, Gradle, Groovy, Maven and SBT (Scala Build Tool)|
|docker| This role installs Docker.|
|docker_certificate| This role install the Docker certificate.|
|docker_registry| This role installs the Docker registry.|
|gogs| This role installs GOGS as a locally hosted Git repository.  It depends upon the baseline, mariadb and nginx roles.|
|golang| This tool installs Golang.|
|httpd_tools| This role installs HTTPD tools.|
|java_alt| This role installs alternate Java SDKs.|
|java_sdk| This role installs the Java SDK.|
|jenkins | This role installs the Jenkins build tool.  It depends upon the common and ci_proxy_nginx roles, which will be installed first.|
|mariadb| This role installs MariaDB (MySQL).|
|mongodb| This role installs RoboMongo.|
|nginx| This role installs NGINX as a reverse proxy for Jenkins, GOGS, SonarQube and Artifactory.|
|node_js| This role installs Node JS.|
|packer| This role installs Packer.|
|robo_mongo| This role installs the RoboMongo database|
|sonarqube| This role installs the SonarQube code quality tool.  It depends upon the common, mariadb and nginx roles.|

##Role Variables

A role may contain a vars folder with a main.yml file in it.  This file will contain any [variables](http://docs.ansible.com/ansible/playbooks_variables.html) for that role, e.g. version number.

##Role Templates

Templates provide a method for substituting an Ansible variable into a file.  For example, the MySQL port number is used by several roles.  By adding the relevant configuration file to a role's templates folder (with a .j2 file extension e.g. config.xml.j2) the role's configuration can be changed.  See the [Ansible templates documentation](http://docs.ansible.com/ansible/template_module.html) for more details.

