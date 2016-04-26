# CentOS 7 with systemd and ssh


#### Testing Virtual Machine hosts

This image can be used when there is a need to emulate a Virtual Machine to test the provisioning with playbooks. In contrast to containers, Virtual Machines can run more than one service and therefore. In order to be able to test setting up and starting services in the container, systemd is required.

By using docker containers for testing, ansible plays targeting several hosts can be executed within a single development machine at the same time, emulating deployment to complex topologies. It is important that the container is created from an image which replicates the Operating System used by the Virtual Machine where the roles are ultimately run against. This image can be safely used to test deployments on machines running CentOS 7 or RHEL 7.

The image is not meant to be used in production environments due to security reasons as systemd requires the container to run in privileged mode.



#### Building the image

The following files are used to create the image:

- [build.sh](./build.sh): encapsulates the docker command used to build the image.
- [Dockerfile](./Dockerfile): the file used to build the image.



#### Configuring the playbook to use the image

After building the image, tell the [runner](../../provision/run.yml) to use the image by updating the **"container_image"** variable of the [target_host_n](../../provision/target_host1.yml) to the name of the CentOS 7 image with systemd and ssh: **"gatblau/centos:7ds"**.



#### Running the playbook

Now the playbook can be run by executing the following command **ansible-playbook run.yml**

As a result, a new image will be created out of the base image and committed to the local registry. It can be seen by running the  **docker images** command.



#### Running a container from the image

A container can now be run in privileged mode, for example, by running the following command (need to replace the variables as required):

[~]# **docker run --name** container_name **-d -p** host_port:container_port **--privileged** container_image:container_image_version command 

where:
- **container_image**: the name of the docker image to use.
- **container_name**: the tag of the created container.
- **container_port**: the port exposed by the image.
- **container_image_version**: the version of the image to use.
- **host_port**: the port mapped on the host.
- **command**: the entry point for the container.

