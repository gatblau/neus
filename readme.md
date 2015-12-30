## Continuous Integration Environment

The Continuous Integration (CI) environment provides the following tools:

- Build server - [Jenkins](https://jenkins-ci.org/)
- Source repository - [GOGS](https://gogs.io/)
- Artefact repository - [Artifactory](https://www.jfrog.com/open-source/#os-arti)
- Code quality tool - [SonarQube](http://www.sonarqube.org/)
- Database - [MariaDB](https://mariadb.org/)

Currently, the CI environment is available in two variants

- Bronze - one platform (CentOS VM or Docker container)
- Silver - two or more virtual machines

There are two more variants planned.

- Gold
- Platinum


### Folders

| Folder | Description |
|--------|--------|
| blueprints |This folder contains the blueprints to build each environment (play and inventory files). |
| files |This folder contains the cache folder for installation files (created by build scripts). |
| group_vars |This folder contains variables assigned to particular groups. |
| plays | This folder contains common play files used by roles. |
| roles | This folder contains the roles that can be used to build an environment. |
| scripts | This folder contains shell scripts. |
