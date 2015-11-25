## CI Docker Image

This folder contains the files to create a CI Bronze Docker image.  Note: the centos7-sysd Docker image must be created before building the CI Docker contanier.

## IntelliJ Idea

The following details how to build the Docker CI Bronze image using IntelliJ Idea 15 using the Europa VM (which can be found [here](http://github.com/gatblau/europa)).  For Docker Support in IntelliJ Idea, click [here](https://blog.jetbrains.com/idea/2015/03/docker-support-in-intellij-idea-14-1/).

Download and install the **Docker integration** and **BashSupport** plugins (IntelliJ will need to be restarted).

### Docker Connection

Open a terminal and run the following command: `sudo chmod 0666 /var/run/docker.sock` to allow access to the Docker socket.  

If using Europa then place this command in .bash_profile so that it is run each login as the permissions are reset when Europa is restarted.

**Using IntelliJ Idea:**

Select File -> Settings

Search for Clouds, click the + sign, add new Docker deployment and set the following:

Name:    Docker

API URL: unix:///var/run/docker.sock

### Build Docker Image

Using IntelliJ Idea:

Right click on `build.sh` and select **Run 'build.sh'**.

### Docker Container Settings

Using IntelliJ Idea:

Open the **Application Servers** window, right click on the cibronze Docker image and select **Create Container** then **create**.

Enter a name for the container, e.g. **cibronze**.

Select the **Container** tab and enter the following:

- Select the JSON file using the following path:  `neus/plays/blueprints/ci_env/docker/docker-settings/container_settings.json`.
- Set the **Entrypoint** to `/usr/startup.sh`.

