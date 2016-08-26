# VDUN

V agrant
D ocker
U buntu
N vm

# Usage

Make sure you have Vagrant and Docker installed. Then, start everything with:

```bash
vagrant up --provider="docker"
```

You can check that your server is running with:

```bash
curl http://localhost:80
```

# Explanation

Wouldn't it be nice if you could test your nodejs projects in any node version while still using the same setup to deploy your work to both development and production environments? So when you talk virtualization so many flags are thrown in terms of options and deployability. This setup streamlines that process. You don't have to worry about the ram, cpu, disk, host OS ect. This will install and run on Linux, OSX, & Windows. Which enables you to utilize almost any hardware as a host machine. Vagrant is used to spin up a host container which detects if docker exists on the host machine and if not installs it. This para-container can be installed on any provider or machine that supports Vagrant or Docker.

Introducing VDUN [~Vee-Done]

The Vagrant. Docker. Ubuntu. NVM test suite.

# Installing

You need to install both Vagrant & Docker on the host machine to get the best of both worlds. However, you may utilize a Docker only provider by running Docker instead of Vagrant. Proper startup occurs when running either Vagrant or Docker. Utilizing Vagrant adds overhead but enables install on systems that don't fully support docker for linux containers (Such as Windows).

# Usage

Build the para-container with:
```bash
vagrant up --provider=docker
```

The above command will run and install everything you need for Ubuntu 14.4 to run docker and the example server. Below is an optional method to use Docker only as a containered provider bypassing Vagrant.

Build the docker (Optional) with:
```bash
docker ...
```

### Server/app.js
This is the super simple Node.js server. You would replace this with your own code. This test server code responds to everything with 'Hello World'. Defaults to '0.0.0.0' (Generally this is required due to dockers internal mechanics).

# Notes

This setup is designed to run using either vagrant or docker. As such it can deploy on hosting solutions that support either vagrant or docker.

# Notice

This setup runs your nodejs script as root. This is not ideal in a production setup.