## Commands

### CI Docker Container

The following commands will build a CI Docker image and create a CI Docker container from the command line.

- Build CI Docker image

Run `build.sh` which will download required installation files and then run the following Ansible command:

`ansible-playbook run.yml`

- Create CI Docker container

`docker run --name cidocker -d -p 80:80 -p 3306:3306 gatblau/cidocker:1.0 /usr/startup.sh` 

- Connect to running CI Docker container

`docker exec -i -t cidocker bash`
