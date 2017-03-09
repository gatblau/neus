Cache Backup
============

This folder contains the files to upload and download the files in a Neus cache folder to or from a Nexus repository.
 
Before uploading files, the following variables, in [roles/upload_cache/defaults/main.yml](roles/upload_cache/defaults/main.yml) should be updated:
 
| Variable | Description |
|----------|----------|
| tool_name | Which tool folder to upload: `cdtools`, `citools`, `pamm` or `jamm`. |
| nexus_user | Nexus deployment user. |
| nexus_user_pwd | Nexus deployment user password. |
| nexus_repo_url | Path to Nexus repository where files will be uploaded.  Default is `citools`. |
 
Once updated, execute the `run.sh` script with `upload` as an argument.

Before downloading files, the following variables, in [roles/download_cache/defaults/main.yml](roles/download_cache/defaults/main.yml) should be updated:
  
| Variable | Description |
|----------|----------|
| tool_name | Which tool folder to upload: `cdtools`, `citools`, `pamm` or `jamm`. |
| nexus_user | Nexus deployment user. |
| nexus_user_pwd | Nexus deployment user password. |
| nexus_repo_url | Path to Nexus repository where files will be uploaded.  Default is `citools`. |
| cache_files | List of cache files to download. |
  
Once updated, execute the `run.sh` script with `download` as an argument.
 