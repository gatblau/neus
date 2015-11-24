##Role Based Play Files

For a description of [Ansible roles](http://docs.ansible.com/ansible/playbooks_roles.html) click on the link.

Roles are used to group together tools required to fulfil a function.  For example, Jenkins
(jenkins role) depends upon other tools being installed, for example a Java SDK (java_sdk) and build tools (common role).  These dependencies are stored in meta/main.yml.

The standard CI Compact environment uses the following roles:
- artifactory (artefact repository)
- gogs (source repository)
- jenkins (build tool)
- sonarqube (code quality)

The Europa environment uses the following roles:
- common
- db_development
- java_sdk
- intellij_idea
- eclipse_jee
- eclipse_scala
- dev_tools

The following describes the folders:

| Folder | Description |
|--------|--------|
| blueprints |This folder contains the blueprints for each environment (play and inventory files). |
| group_vars |This folder contains variables assigned to particular groups. |
| plays | This folder contains play files used by roles. |
| roles | This folder contains the roles that can be used to build an environment. |
| scripts | This folder contains shell scripts used by roles. |

The following describes the files used to build an environment:

| File | Description |
|--------|--------|
| book-*.yml | These files are used by the build script (build.sh) to create an environment (CI Compact, Europa etc.) from a new minimal CentOS VM image. |
