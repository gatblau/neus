# Continuous Integration Tools

The Continuous Integration Tools (CITOOLS) solution is a set of blueprints to automatically deploy a predefined set of 
Continuous Integrations tools on either Virtual Machine infrastructure or Container Management Infrastructure.

The set of tools in the solution is as follows:

- **Reverse Proxy**: [NGINX](https:/) is used as a reverse proxy server running only on Virtual Machine configurations. The proxy is used to map incoming requests to the various service URI/Ports within the virtual machine.
- **Build Server**: the build server is [Jenkins](https://jenkins-ci.org/), and is deployed in standalone or master-slave(s) configurations depending on the chosen blueprint.
- **Source Control Management**: the source code repository can be either GOGS "[GO Git Service](https://gogs.io/)" deployed locally or an RTC [Rational Team Concert](https:/) instance, that is outside of this solution and connected to via configured URI.
- **Binary Artefact Repository**: the repository where compiled assets are deployed is [Sonatype Nexus](https://).
- **Code Quality Management**: [SonarQube](http://www.sonarqube.org/) is used to perform static code analysis and provide code quality metrics to the development team.
- **Database**: [MariaDB](https://mariadb.org/) is the database behind SonarQube and the artefact repository metadata.
- **Code Review Workflow**: provided via [Gerrit](https://).

## Avaliable Configurations

The CITOOLS solution is available for deployment on the following infrastructure.
 
### Virtual Machine (or Physical) Infrastructure 
 
Running CentOS or RHEL 7, via the following blueprints:

- [Bronze](blueprints/bronze/readme.md): the minimum configuration running on two virtual machines.
- [Silver](blueprints/silver/readme.md): a relatively small configuration for cases where more performant builds are required. Runs on three virtual machines configuration.
- [Gold](blueprints/gold/readme.md): a larger and scalable configuration using five virtual machines.
- [Platinum](blueprints/platinum/readme.md): un-compromised performance for multi-project builds using a configuration of seven virtual machines.

### Container Management Platforms

Running CentOS or RHEL 7 based Docker containers.

This is supported via the [Silicon](blueprints/silicon/readme.md) blueprint.
In contrast to the Virtual Machine blueprints, the silicon blueprint is used to create Docker Images for each of the services within the CITOOLS solution.
The images can then be uploaded into a Docker registry, where Container Management platforms can deploy them as needed.

Bootstraps files for deployment are provided for the following Container Management platforms:

- [Openshift Enterprise 3.1](blueprints/silicon/os3)
- [Docker Compose](blueprints/silicon/compose)


### Project Folder Structure

The following table describes the content of the main folders in the CITOOLS project:

| Folder | Content |
|:--------|:--------|
| blueprints |The files required to build each blueprint configuration - i.e. playbook, inventory and container creation files. |
| cache |The cached packages for deployment in offline mode. These packages are downloaded from the internet by the [fetch.sh](fetch.sh) file. |
| roles | The roles used by the blueprints to deploy the CITOOLS. |
| scripts | The generic shell library scripts used by other scripts in the solution. |