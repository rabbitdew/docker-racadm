#!/bin/bash

# Change the boot order to boot from the hard disk again.
timeout 3 bash -c "docker run --rm myDockerRepo.com:5000/racadm:latest  -u root -p ${PASS} -r ${1} set BIOS.biosbootsettings.BootSeq HardDisk.List.1-1,NIC.Integrated.1-1-1"

# Reboot
timeout 3 sh -c "docker run --rm myDockerRepo.com:5000/racadm:latest  -u root -p ${PASS} -r ${1} jobqueue create BIOS.Setup.1-1 -r pwrcycle -s TIME_NOW -e TIME_NA"
