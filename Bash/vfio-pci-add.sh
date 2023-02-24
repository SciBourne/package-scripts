#!/bin/bash

hostgr="0000:02:00.0"
hostau="0000:02:00.1"
grid="10de 1380"
auid="10de 0fbc"


echo $grid > "/sys/bus/pci/drivers/vfio-pci/new_id"
echo $hostgr > "/sys/bus/pci/devices/$hostgr/driver/unbind"
echo $hostgr > "/sys/bus/pci/drivers/vfio-pci/bind"

echo $auid > "/sys/bus/pci/drivers/vfio-pci/new_id"
echo $hostau > "/sys/bus/pci/devices/$hostau/driver/unbind"
echo $hostau > "/sys/bus/pci/drivers/vfio-pci/bind"
