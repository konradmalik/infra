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
	-device virtio-net,netdev=vmnic -netdev user,id=vmnic \
	-drive file="$HOME/VMs/devarch.qcow2",if=virtio \
    -cdrom "$HOME/VMs/archlinux-2022.05.01-x86_64.iso" \
    ;
# we use qemu64 not host due to 'write memory' errors on intel macs
