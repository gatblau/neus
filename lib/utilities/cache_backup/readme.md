Cache Backup
============

This folder contains the files to upload a Neus cache folder to a Nexus repository.
 
 Before running this playbook, the following variables, in [roles/upload_cache/defaults/main.yml](roles/upload_cache/defaults/main.yml) should be updated:
 
 | Variable | Description |
 |----------|----------|
 | role_cache_folder | Cache folder - default is for CI Tools. |
 | role_nexus_user | Nexus deployment user. |
 | role_nexus_user_pwd | Nexus deployment user password. |
 | role_nexus_repo_url | Path to Nexus repository where files will be uploaded.  Default is `citools`. |
 
 Once updated, execute the `run.sh` script.
 