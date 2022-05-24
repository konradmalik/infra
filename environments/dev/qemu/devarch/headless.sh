#!/bin/sh

qemu-system-x86_64 \
	-accel hvf \
    -cpu host \
	-smp 6 \
	-m 8G \
    -display none \
	-device virtio-net,netdev=vmnic -netdev user,id=vmnic,hostfwd=tcp::2222-:22 \
	-drive file="$HOME/VMs/devarch.qcow2",if=virtio \
    -D devarch.log \
    ;
    #-daemonize \
