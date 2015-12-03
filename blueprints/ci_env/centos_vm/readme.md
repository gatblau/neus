# CI CentOS 7 Environment

To build a CI CentOS 7 environment requires a CentOS 7 virtual machine created using the CentOS 7 minimal ISO image and the [centos71-txt-ks.cfg](centos71-txt-ks.cfg) kickstart file.

A CI environment can be either bronze or silver.  A bronze CI environment is contained on one VM, a silver CI environment can be split onto more than one VM.

## CI Environment Build on Remote VM(s) Using Europa

Open a terminal windows and carry out the following:

- Clone the Neus repository to the Europa environment `git clone http://github.com/gatblau/neus /home/europa/neus`

- Ensure *sshpass* is installed `sudo yum sshpass install -y`

- Change to *centos_vm* folder `cd ~/neus/blueprints/ci_env/centos_vm`

- Logon to every CentOS VM to record it's ssh key `ssh root@111.111.111.111` *(substitute real VM IP address(es) for 111.111.111.111)*

Update the appropriate inventory file for the environment level ([inv-bronze.txt](inv-bronze.txt) or [inv-silver.txt](inv-silver.txt)) with the IP address(es) of the VMs.  A bronze environment has only one IP address, while a silver environment can have two, three or four IP address.

- Run the build (bronze) `sh build-remote.sh inv-bronze.txt`

- Run the build (silver) `sh build-remote.sh inv-silver.txt`

The build process will fetch installation files for the build and then install the CI environment.  Once the build has completed, follow the instructions for setting up the environment contained in the CI environment [readme](../readme.md).

## CI Environment Build on Local VM Using Command Line

Logon to the CI environment and carry out the following:

- Clone the Neus repository to the Europa environment `git clone http://github.com/gatblau/neus /home/europa/neus`

- Change to *centos_vm* folder `cd ~/neus/blueprints/ci_env/centos_vm`

- Run the build `bash build-local.sh`

The build process will fetch installation files for the build and then install the CI environment.  Once the build has completed, follow the instructions for setting up the environment contained in the CI environment [readme](../readme.md).
