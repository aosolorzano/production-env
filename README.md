Author: Andres Solorzano
Level: Advanced
Technologies: Vagrant, Ansible, Docker, Docker Compose, Docker Swarm
Target Product: Hiperium Project

What is it?
This is an automated infrastructure project that creates all virtual machines includes its virtual networks, to allow the Hiperium Project Microservices runs on it.

System requirements
Oracle Linux 7 with Unbreakable Kernel 4 or another RHEL 7 distribution.
This project uses Vagrant with VirtualBox 5 plugin to install virtual machines. For this reason its not recomended to install the O.S. using an UEFI partitioning.

Start the process
You need to start the Linux scripts inside the parent folder of this project depending on your needs. Each scripts install and configure parts of the overall system.
