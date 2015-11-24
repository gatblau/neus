## Commands

### CI Bronze Docker Container

- Build CI Bronze Docker image

`ansible-playbook run.yml`

- Create CI Compact Docker container

`docker run --name cidocker -d -p 80:80 -p 3306:3306 gatblau/cidocker:1.0 /usr/startup.sh` 

- Connect to running CI Compact Docker container

`docker exec -i -t cibronze bash`


## Encrypt Passwords

Install Passlib hashing library:
`pip install passlib` 

Following command will prompt for a password then print the encrypted hash:
`python -c "from passlib.hash import sha512_crypt; import getpass; print sha512_crypt.encrypt(getpass.getpass())"`


## Export and Import MySQL Databases

backup: # mysqldump --database gogs > gogs-export.sql
sudo docker cp cibronze:/gogs-export.sql gogs-export.sql

backup: # mysqldump --database artifactory > art-export.sql
sudo docker cp cibronze:/art-export.sql art-export.sql

restore:# mysql -u admin -p Passw0rd! gogs < import.sql
restore:# mysql -u admin -p Passw0rd! artifactory < import.sql


## Copy Files from Docker Container

`docker cp <containerId>:/file/path/within/container /host/path/target`