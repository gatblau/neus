# CI Environment

The folder contains the blueprints for the Continuous Integration (CI) environment.

- *centos_vm* is the blueprint for a CI environment hosted on a CentOS 7 virtual machine

- *docker* is the blueprint for a CI environment Docker image


## CentOS VM

Once the CentOS VM CI environment has been built, the following checks are required:

- Open a browser and check that the following tools are running:

    * Jenkins `<ip-address>/jenkins`
    * GOGS `<ip-address>/git`
    * Artifactory `<ip-address>/artifactory`
    * SonarQube `<ip-address>/sonar`

If any services are not running:

- Logon to the VM as root

- Check the service status `service jenkins|git|artifactory|sonar status`

- Restart the service `service jenkins|git|artifactory|sonar restart`

- Wait for the service to restart and check the browser by refreshing to ensure it has restarted

**Smoke Test the Environment**

Go to the Jenkins browser window and login (jenkins:jenkins).

Select **Manage Jenkins** and check to see if the plugins need updating.  If they do, select **Manage plugins** scroll down select **All** then click on **Download now and install after restart**.  Click the **restart Jenkins when installation is complete and no jobs are running** check box.  

When Jenkins has restarted, login again and run the **Smoke Test** build job.  The build job polls the GOGS repository for changes every 15 minutes and may have already run.  If the smoke test has failed, check the console output and rectify any problems.  

When the smoke test has run successfully the CI environment is ready to use. 
