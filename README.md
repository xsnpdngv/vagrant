# vagrant
Reproducible and portable development environment

Vagrant configuration for a Ubuntu virtual machine with a bunch of basic,
necessary and useful development related packages preinstalled mostly for
C.

Prerequisites
-------------

Download and install Vagrant and VirtualBox

- [www.vagrantup.com](https://www.vagrantup.com)
- [www.virtualbox.org](https://www.virtualbox.org)

Provisioning
------------

The packages that Vagrant installs in the VM on the first startup
(and on each provisioning) can be browsed in / commented out from /
added to `instpkgs.sh`.

The `setlimits.sh` shell script is also executed by vagrant on
provisioning (like 1st startup) in order to have some system wide
settings done regarding the core file generating and message queue
limits. Feel free to comment them out or modify as needed.

Run
---

Once Vagrant and VirtualBox are installed, and optionally the
modifications in the configuration file and/or in the provisioning scripts
are done, the Virtual Machine can be booted up from its directory.

```bash
git clone https://github.com/xsnpdngv/vagrant.git
cd vagrant
vagrant up
```

After the VM is booted up, it can be reached through either the builtin
ssh command: `vagrant ssh`, or with the standard ssh program.

```bash
ssh -p 2222 vagrant@localhost
```

X11 forward
-----------

In order to have X11 forwarded to the host machine from the guest OS,
the host OS first has to run an X server. For Windows
[MobaXterm](http://mobaxterm.mobatek.net) might be a good and lightweight
choice as such; for MacOS [XQuartz](https://www.xquartz.org)
is the standard way; while on Linux having an X server is not a question.

After having the X server run on the host, the VM has to be ssh'd with X11 forwarding
option enabled (the Vagrant configuration enables this kind of access), and a program
with GUI can be simply run and displayed...

```bash
ssh -X -p 2222 vagrant@localhost
xterm &
```
