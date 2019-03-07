#!/bin/bash

# Change the boot order to PXE boot.
timeout 5 bash -c  "docker run --rm myDockerRepo.com:5000/racadm:latest -u root -p ${PASS} -r ${1} set BIOS.biosbootsettings.BootSeq NIC.Integrated.1-1-1,HardDisk.List.1-1"

# Reboot
timeout 5 bash -c "docker run --rm myDockerRepo.com:5000/racadm:latest  -u root -p ${PASS} -r ${1} jobqueue create BIOS.Setup.1-1 -r pwrcycle -s TIME_NOW -e TIME_NA"
