LXC
===

LXC is an implementation of a container system under the Linux kernel. Containers are similar to virtual machines in that they allow a self-contained operating system to be run under a currently running operating system. The big difference is that the containers all share the same running kernel. This means that you can only run Linux in LXC containers. However, you can run different distributions of Linux, with some limitations, in containers. 

Some advantages of LXC over full virtualisation:

- Fast. 100% of the native speed of the machine
- Low memory & disk foot print. The applications and OS image take up only as much space as they consume. Under full virtualisation RAM and disk is often over-allocated.
- Fast and easy stand up. Simple tools to spin up new instances

Some disadvantages:

- Environments are tied to a single kernel, which present more potential security risks.
- LXC documentation is pretty poor
- Can only run Linux and the Linux in the container must be compatible with the running kernel.

All in all, it's handy if you're already running Linux and want to test things out in a clean installation. Particular use cases are configuration management development (puppet, chef, cfengine etc.) and software package creating (building RPMs under Ubuntu, for instance).

Creating CentOS containers on an Ubuntu 12.04 system
----------------------------------------------------

This guide assumes that lxc is already installed (sudo apt-get install lxc)

1. Copy the lxc-centos file from https://raw.github.com/mattwillsh/puppet-environment/master/lxc-centos to /usr/lib/lxc/templates
2. Run:
    sudo lxc-create -n myfirstcontainer -t centos
3. Wait a while while the image gets cached. 
4. Run:
    sudo lxc-start -n myfirstcontainer -d
5. Wait a little while. ping myfirstcontainer.local if you like
6. Run:
    ssh root@myfirstcontainer.local 
7. Default password is root

You are now inside a running container and, on the whole, it can be configured as a real machine would be. You might want to do a yum groupinstall base to get a full base OS.

