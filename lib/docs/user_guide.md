# CI Tools User Guide

## Toolset

The CI Tools consist of the following tools:

- [Jenkins](https://jenkins.io/)
- [GOGS](https://gogs.io/)
- [SonarQube](http://www.sonarqube.org/)
- [Nexus OSS](https://books.sonatype.com/nexus-book/reference/)

The tools are accessed by using a browser with the IP address of the platform and the port number for the tool:
 
- [Jenkins](../../citools/roles/jenkins_master/readme.md)
- [GOGS](../../citools/roles/gogs/readme.md)
- [SonarQube](../../citools/roles/sonar/readme.md)
- [Nexus OSS](../../citools/roles/nexus/readme.md)

## Pre-Use Checks

Once the CI Tools environment has been provisioned, the following pre-use checks are required:

- Change the default passwords for the CI Tools if the environment is internet facing.

- Jenkins Plugins: login to Jenkins, and select *Manage Jenkins* and check the plugins' status and update if there are updates available.

- PAMMY build pipeline: if the PAMMY build pipeline was included in the build, check to see if the build pipeline has started.  If not, select the *All* view and schedule a build for the pammy-check-code-quality build job.  Depending on network speed, the first build will take about 30 minutes as SBT downloads jar files.  Subsequent builds will run quicker as the jar files have already been downloaded.

## Additional Setup
 
### Jenkins Email Notification

The Jenkins [extended email plugin](https://wiki.jenkins-ci.org/display/JENKINS/Email-ext+plugin) is already installed on the CI Tools environment.  See the plugin web page for details on setting up email notification.
