**NOTE**:
This instruction is for Ubuntu Server. On other systems it can be differnet.

# Network

Network is managed by netplan. Modify the `01-network.yaml` file (password, dns) and copy it into: `/etc/netplan/01-network.yaml`. It will work upon restart.

# Deployment

Services that should run are defined in `docker-compose.yaml`.
Details and setup are below.
TLDR for running:

```bash
$ make create
```

To undeploy:

```bash
$ make delete
```

# Service-specific instructions

## PiHole

### Running

Simply running pihole won't work, because port 53 is in use by systemd-resolved.
This is a local dns server that caches results and talks with dns provided by the router.
Simply disabling this service won't work either, because there won't be any dns resolvers on the machine (no internet).

Follow the below steps to make all work:

1. Disable systemd-resolved `sudo systemctl disable systemd-resolved && sudo systemctl stop systemd-resolved`
2. Remove resolv.conf (this is a symlink to the one provided by the systemd-resolved): `sudo rm /etc/resolv.conf`
3. Create proper local hostname entries so that the system can resolve the hostname of the machine.
   Example:

```
# /etc/hosts
127.0.0.1 localhost
::1 localhost
127.0.1.1 rpi4-1.localdomain <your machine hostname from /etc/hostname>
```

4. Set up manual, external DNS addresess for the machine that pihole will run on. Example:

```
# /etc/resolv.conf
nameserver 1.1.1.1
nameserver 1.0.0.1
nameserver 9.9.9.9
```

5. Now edit the `docker-compose.<machine>.yaml` and make sure all is setup as you want. Remember to change `ServerIP` to the IP you will use for pihole DNS capabilities.
6. This is it. Now run it and configure your clients or router accordingly!

### Updating

To update:

1. Update image version in `docker-compose.yaml`
2. Run `make delete && make create`

## HD Idle (spin down unused disks)

First add the disk you want to have connected to the fstab file so that it's mounted on startup.

Then install `hd-idle` - `sudo apt install hd-idle`.

Then setup the service `hd-idle.service` to do what you want.
You should not edit the service file, edit `/etc/default/hd-idle` instead. Examplary content:

```
HD_IDLE_OPTS="-a /dev/sda -i 300"
```

Finally, enable and start this service.
`sudo systemctl enable --now hd-idle.service`

