#!/bin/sh

qemu-system-x86_64 \
	-accel hvf \
    -cpu qemu64 \
	-smp 2 \
	-m 4G \
	-usb \
	-device usb-tablet \
	-vga virtio \
	-display default,show-cursor=on \
	-device virtio-net,netdev=vmnic -netdev user,id=vmnic,hostfwd=tcp::2222-:22 \
	-drive file="$HOME/VMs/devarch.qcow2",if=virtio \
    ;
# we use qemu64 not host due to 'write memory' errors on intel macs
