#!/bin/bash


if [ -f /lib/firmware/edid ]
then
    rm -rf /lib/firmware/edid
fi


if [ -f /etc/dracut.conf ]
then
    rm -f /etc/dracut.conf
fi


mkdir /lib/firmware/edid &&

cp philips-edid.bin /lib/firmware/edid/philips-edid.bin &&
cp dracut.conf /etc/dracut.conf &&

dracut --force
