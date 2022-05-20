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

1. Handle systemd-resolved
   Modern releases of Ubuntu (17.10+) include systemd-resolved which is configured by default to implement a caching DNS stub resolver.
   This will prevent pi-hole from listening on port 53.
   The stub resolver should be disabled with: `sudo sed -r -i.orig 's/#?DNSStubListener=yes/DNSStubListener=no/g' /etc/systemd/resolved.conf`.

This will not change the nameserver settings, which point to the stub resolver thus preventing DNS resolution.
Change the /etc/resolv.conf symlink to point to /run/systemd/resolve/resolv.conf, which is automatically updated to
follow the system's netplan: `sudo sh -c 'rm /etc/resolv.conf && ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf'`
After making these changes, you should restart systemd-resolved using systemctl restart systemd-resolved

2. RPI static ip
   - make sure the provided netplan is used
   - you'll be disabling the DHCP server of your router and running that through pihole, so there is a bootstrap problem - how to assign IP to RPI? We use static IP `192.168.0.2` (make sure it's in the same segment as your gateway/router, eg. 192.168.0.1)
   - disable DHCP on your router
3. Run the stack
   - make create
4. Done

If RPI dies or whatever, you'll need to:

- use a computer
- connect to wifi
- assign a static IP address, anywhere from 192.168.0.X but not 1 neither 2
- connect with the router at 192.168.0.1
- enable dhcp

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
