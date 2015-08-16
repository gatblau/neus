# EUROPA

## Overview
Europa is a Virtualised Development Environment (VDE) aimed at speeding up the process of installing the tools and middleware required to develop applications using Java, Scala, Groovy and JavaScript. It provides a ready to use set of development tools and the ability to run middleware such as Web Servers, Databases, etc. on standardised Linux containers as part of the environment via [Docker](https://www.docker.com/whatisdocker).

## Using the VDE
The VDE can be used in two different ways:

| Access | Description |
|:---------|:------------|
| Remote | This option ([VDI](https://en.wikipedia.org/wiki/Desktop_virtualization#Virtual_desktop_infrastructure)) provides an easy way to access the VDE over a TCP connection. The main advantage is that it can be accessed from multiple devices and is centrally backed up. The key disadvantage is that it cannot be used if offline or in a slow network. |
|Local |This option requires a product such as [Oracle Virtual Box](https://www.virtualbox.org/) to be installed in the development machine and the VDE compatible image to be imported into the product. The advantage of this option is that the VDE can be used offline. The key disadvantages are that the VDE image needs to be copied into the development machine (which can take a while if downloaded over a slow connection) and the development machine needs to have at least 8GB of available RAM memory (4GB allocated to the Virtual Machine) and preferably a Solid State Disk (SSD) drive for speed.| 

## Provided Components
### Integrated Development Environments (IDE)
The VDE has the following IDEs:

| Tool | Description |
|:-----|:------------|
| ScalaIDE | The primary tool used to develop Scala based applications using Play or Akka.|
| JBoss Development Studio| JBoss Development Studio (JBDS) is the primary tool to develop aplications using JBoss EAP, JBoss Fuse, JBoss BRMS and JBoss BPMS.|
| IntelliJ IDEA| Provides a nice set of development productivity tools and can be used to develop Scala, Java, JavaScript and Groovy applications. **NOTE:** IntelliJ starts with a 30-day trial of Ultimate Edition. A valid key must be entered after the trial period to avoid expiration. After launching IntelliJ, activate plugins as required.|

### Build Tools

The following build tools are included in the distro:

| Tool | Description |
|:-----|:------------|
| Maven | Apache Maven is included as the standard build tool for Java based projects. |
| Gradle | Gradle is included as an alternative to Maven which leverages the use of Groovy instead of XML for build configuration files. Gradle provides a simpler way to create plugins and extensions when standard components are not good enough.|
|SBT|The Simple Build Tool (SBT) is provided primarily to build Scala projects. It uses Scala to define build tasks. It also allows to run the tasks in parallel from the shell.|

### Languages
| Language | Description |
|:---------|:------------|
| Java | supported via JDK 1.8 and provided via JDBS and IntelliJ. |
| Scala| supported via JDK 1.8 and provided via TypeSafe Activator, ScalaIDE and IntelliJ. |
| Groovy | suported via Command Line and IDEs.|
| JavaScript| best support via IntelliJ.|
|Other| supported via IDEs plugins.|

