# VDUN

Vagrant
Docker
Ubuntu
Nvm

# Usage

Be sure you have Vagrant & Docker (Optional *See Notes) installed. Then, start everything with:

```bash
vagrant up
```

After the install you can check that your server is running with:

```bash
curl http://127.0.0.1:8080
```

# Explanation

Wouldn't it be nice if you could test your nodejs projects in any node version while still using the same setup to deploy your work to both development and production environments? So when you talk virtualization so many flags are thrown in terms of options and deploy-ability. This setup streamlines that process. You don't have to worry about the ram, cpu, disk, host OS ect. This will install and run on Linux, OSX, & Windows. This enables you to utilize almost any hardware as a host machine. Vagrant is used to spin up a host container which detects if docker exists on the host machine and if not installs it. This para-container can be installed on any provider or machine that supports Vagrant or Docker.

Introducing VDUN [~Vee-Done]

The Vagrant. Docker. Ubuntu. NVM development suite.

# Installing

You need to install both Vagrant & Docker on the host machine to get the best of both worlds. However, you may utilize a Docker only provider by running Docker instead of Vagrant. Proper startup occurs when running either Vagrant or Docker. Utilizing Vagrant adds overhead but enables install on systems that don't fully support docker for Linux containers (Such as Windows systems without full virtualization).

Using Node
```bash
npm install vdun
```

Using Git
```bash
git clone https://github.com/talkquazi/vdun
```

*Notice: There is currently no module entry point method to spin-up vdun using a nodejs module. npm install is not needed either. The above install methods are simply to clone the source code.

# Advanced Usage

Build the para-container with:
```bash
vagrant up
```

The above command will run and install everything you need for Ubuntu 14.4 to run docker and the example server. Below is an optional method to use Docker only as a containerized provider bypassing Vagrant.

Build the docker (Optional entry point) with:
```bash
docker build .
```

# Server/app.js
This is the super simple Node.js server. You would replace this with your own code. This test server code responds to everything with 'Hello World'. Defaults to '0.0.0.0' port 8080.

# Notes

This setup is designed to run using either vagrant or docker. As such it can deploy on hosting solutions that support either vagrant or docker.

Installing both docker and vagrant on the host machine will speed up the initial vagrant bootup as the system will not have to run a virtual instance and install docker for you then. This is the ideal method to have both vagrant and docker installed on a host machine if you are distributing on a cloud.

Modifying onExit.sh is the easiest way to configure your own shutdown detection with this setup.

You can change which version of node to use by editing the .nvmrc file within the projects main folder.

# Notice

This setup runs your nodejs script as root. This is not ideal in a production setup.
