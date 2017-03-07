# Continuous Integration Tools

The Continuous Integration Tools (CITOOLS) solution is a set of blueprints to automatically deploy a predefined set of 
Continuous Integrations tools on either Virtual Machine infrastructure or Container Management Infrastructure.

The set of tools in the solution is as follows:

- **Build Server**: the build server is [Jenkins](https://jenkins-ci.org/), and is deployed in standalone or master-slave(s) configurations depending on the chosen blueprint.
- **Source Control Management**: the source code repository can be either GOGS "[GO Git Service](https://gogs.io/)" deployed locally or an RTC [Rational Team Concert](https:/) instance, that is outside of this solution and connected to via configured URI.
- **Binary Artefact Repository**: the repository where compiled assets are deployed is [Sonatype Nexus](https://).
- **Code Quality Management**: [SonarQube](http://www.sonarqube.org/) is used to perform static code analysis and provide code quality metrics to the development team.
- **Database**: [MariaDB](https://mariadb.org/) is the database behind SonarQube and the artefact repository metadata.

## Avaliable Configurations

The CITOOLS solution is available for deployment on the following infrastructure.
 
### Virtual Machine (or Physical) Infrastructure 
 
Running CentOS or RHEL 7, via the following blueprints:

- [Basic](docs/images/ci-basic.png): the minimum configuration running on one virtual machine.
- [Bronze](docs/images/ci-bronze.png): a small configuration running on two virtual machines.
- [Silver](docs/images/ci-silver.png): a medium configuration for cases where more performant builds are required running on four virtual machines.
- [Gold](docs/images/ci-gold.png): a larger and scalable configuration running on five virtual machines.

### Container Management Platforms

Running CentOS or RHEL 7 based Docker containers:

- [Silicon](docs/images/silicon.png): a set of Docker images for use with an orchestration engine (e.g. OpenShift).

In contrast to the Virtual Machine blueprints, the silicon blueprint is used to create Docker Images for each of the services within the CITOOLS solution.  The images can then be uploaded into a Docker registry, where Container Management platforms can deploy them as needed.

Bootstraps files for deployment are provided for the following Container Management platforms:

- [Openshift Enterprise 3.1](blueprints/silicon/os3)
- [Docker Compose](blueprints/silicon/compose)


### Project Folder Structure

The following table describes the content of the main folders in the CITOOLS project:

| Folder | Content |
|:--------|:--------|
| cache | The cached packages for deployment in offline mode. These packages are downloaded from the internet by the [fetch.sh](fetch.sh) file. |
| docs | Images of each blueprint. |
| group_vars | Group variables files.  Groups are defined in the inventory and group variables declared in this folder. |
| host_vars | Host variables files.  Hosts are defined in the inventory and group variables declared in this folder. |
| inventories | Inventory files required to build each blueprint configuration. |
| roles | The roles used by the blueprints to deploy the CITOOLS. |
| scripts | The generic shell library scripts used by other scripts in the solution. |

## Getting Started

See the [Getting Started](docs/getting_started.md) guide for details of how to build and use the CI Tools environment.

See the [bootstrap](docs/bootstrap.md) guide for details of how the CI Tools are provisioned.
