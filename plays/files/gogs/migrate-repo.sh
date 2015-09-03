# Migrate example repositories to GOGS
wget --post-data="username=vagrant&password=vagrant&clone_addr=/home/vagrant/maven-repo&uid=1&repo_name=maven-repo" http://localhost:3000/api/v1/repos/migrate
wget --post-data="username=vagrant&password=vagrant&clone_addr=/home/vagrant/gradle-repo&uid=1&repo_name=gradle-repo" http://localhost:3000/api/v1/repos/migrate
