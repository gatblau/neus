# PAMM Application Environments

This solution presents various different topologies of environments (blueprints) to deploy a [PAMM application](https://www.github.com/gatblau/pamm.seed). 
The blueprints can be automatically deployed on Virtual Machine infrastructure (bronze to platinum) or Container Management Infrastructure (silicon).

The various services deployed are as follows:

- **HA Proxy**: used as TCP/HTTP Load Balancer in front of PAMM web application instances.
- **Reverse Proxy**: [NGINX](https://www.nginx.com/resources/wiki/) is used as a reverse proxy server running only on Virtual Machine configurations. The proxy is used to map incoming requests to the various service URI/Ports within the virtual machine.
- **PAMM Application**: the [PAMM](https://www.github.com/gatblau/pamm.seed) web application running in Play's own built-in HTTP server.
- **MariaDB**: the relational database management system.
- **MongoDB**: the No-SQL document based database.

## Avaliable Configurations

The PAMM solution is available for deployment on the following infrastructure.
 
### Virtual Machine (or Physical) Infrastructure 
 
Running CentOS or RHEL 7, via the following blueprints:

- [Bronze](blueprints/bronze/readme.md): the minimum configuration running on two virtual machines.
- [Silver](blueprints/silver/readme.md): adds a high availability proxy to load balance two instances of the PAMM application.
- [Gold](blueprints/gold/readme.md): adds cluster databases to the Silver blueprint.
- [Platinum](blueprints/platinum/readme.md): provides 3 PAMM instances and separate clusters for SQL and NO-SQL databases.

### Container Management Platforms

Running CentOS or RHEL 7 based Docker containers.

This is supported via the [Silicon](blueprints/silicon/readme.md) blueprint.
In contrast to the Virtual Machine blueprints, the silicon blueprint is used to create Docker Images for each of the services within the CITOOLS solution.
The images can then be uploaded into a Docker registry, where Container Management platforms can deploy them as needed.

Bootstraps files for deployment are provided for the following Container Management platforms:

- [Openshift Enterprise 3.1](blueprints/silicon/os3)
- [Docker Compose](blueprints/silicon/compose)