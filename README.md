# racadm cli tool forked from stackdot. 
# Thanks stackdot! I used this to PXE a lot of machines 02/2019.
# Was not working on Centos6 at the time I tried it, worked with 7 and also had
# to install openssl packages.


This docker file allows you to run `racadm` commands via docker ( any OS ).
I mostly use it to mass reimage Dell servers.

To PXE boot a bunch of machines: Build the docker image, create a list of iDRAC IPs and
pipe them to the pxe script.

After OS installation, it will probably reboot again. Use the 'unpxe' script to boot from HDD again.

Example usage:

cat idrac_ips.txt | while read i; do ./pxe_boot.sh "${i}"; done

