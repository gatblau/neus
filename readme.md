##Role Based Play Files

For a description of [Ansible roles](http://docs.ansible.com/ansible/playbooks_roles.html) click on the link.

Roles are used to group together tools required to fulfil a function.  The Jenkins role
(jenkins) depends upon other tools being installed, for example a Java SDK (java_sdk) and build tools (common role).  These dependencies are stored in meta/main.yml.

The example, the CI environment uses the following roles:

- artifactory (artefact repository)
- gogs (source repository)
- jenkins (build tool)
- sonarqube (code quality)


The following describes the folders:

| Folder | Description |
|--------|--------|
| blueprints |This folder contains the blueprints for each environment (play and inventory files). |
| files |This folder contains the cache folder for installation files (created by build scripts). |
| group_vars |This folder contains variables assigned to particular groups. |
| plays | This folder contains common play files used by roles. |
| roles | This folder contains the roles that can be used to build an environment. |
| scripts | This folder contains shell scripts. |
