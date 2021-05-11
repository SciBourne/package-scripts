#!/bin/bash


echo
read -p ' New kernel version: ' version


while [[ ! -f /var/db/repos/gentoo/sys-kernel/gentoo-kernel/gentoo-kernel-$version.ebuild ]]; do

    echo
    echo " ERROR: Ebuild with this kernel version does not exist!"
    echo "        Please, input the correct version number."
    echo "        Command for exit: quit"
    echo
    read -p ' New kernel version: ' version

    if [[ $version == 'quit' ]]; then
	exit
    fi

done


if [[ -n $version ]]; then

    echo
    echo ">>> Configure gentoo-kernel-$version ebuild..."
    ebuild /var/db/repos/gentoo/sys-kernel/gentoo-kernel/gentoo-kernel-$version.ebuild configure

    cd /var/tmp/portage/sys-kernel/gentoo-kernel-$version/work/modprep
    mv .config .default
    cp /etc/portage/savedconfig/sys-kernel/gentoo-kernel .config

    echo
    make listnewconfig
    echo

    while true; do
	read -p " Edit your old config? [y/n]: " yn
	case $yn in
	    [Yy]* ) echo;
		    make nconfig;
		    mv /etc/portage/savedconfig/sys-kernel/gentoo-kernel /etc/portage/savedconfig/sys-kernel/gentoo-kernel.old-$(date +%Y.%m.%d-%H:%M:%S);
		    mv .config /etc/portage/savedconfig/sys-kernel/gentoo-kernel;
		    mv .default .config
		    echo;
		    break;;
	    [Nn]* ) echo;
		    mv .default .config
		    exit;;
	    * ) echo " ERROR: Please, answer yes or no!";
		echo;;
	esac
    done
fi
