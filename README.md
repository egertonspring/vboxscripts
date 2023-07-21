# vboxscripts 

## Preparation of the OVA
1. Install plain Ubuntu 22.04 from ISO file.
2. Rename the host to ubuntu22042.
3. Install all the ubdates.
4. install all your needed ssh public keys to the .ssh/authorized_keys
5. Turn SWAP off and delete swapfile
`swapoff -a && rm /swap.img`
6. Remove the swap entry from /etc/fstab
7. Add your user to the sudo group.
`usermod -aG sudo <username>`
8. Make sudo passwordless with NOPASSWD flag in the /etc/sudoers.conf
`visudo`
`%sudo   ALL=(ALL:ALL) NOPASSWD:ALL)`
9. reboot machine
10. delete history
`cat /dev/null > .bash_history`
11. `poweroff`the machine

## Export OVA
Export the virtualbox to an OVA file and name it ubuntu22042.ova

## Use the scripts

1. Import the OVA to a new machine: (The machine name and the hostname are the same and will be needed as parameter $1)
`bash vbox-import.sh <new-machine-name>`

2. If you need change the RAM size (The machine name must be parameter $1 and the new RAM must be parameter $2)
`bash vbox-change-ram.sh <new-machine-name> <new-ram-size>`

3. If you need change the number of CPU cores (The machine name must be parameter $1 and the new CPUs must be parameter $2)
`bash vbox-change-ram.sh <new-machine-name> <new-cpus>`
