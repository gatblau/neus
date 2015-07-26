CREATE DATABASE artifactory CHARACTER SET utf8 COLLATE utf8_bin;
GRANT ALL on artifactory.* TO 'admin@localhost' IDENTIFIED BY 'Passw0rd!';
FLUSH PRIVILEGES;