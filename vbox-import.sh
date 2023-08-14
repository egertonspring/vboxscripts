# You have to specify the machinename as bash parameter $1
# The vbox in this script was exported from a Ubuntu 22.04.2 machine with the hostname ubuntu22042.
# This is necessary to use ansible to change the hostname.

# needs virtualbox and ansible to be installed

machine=$1

vboxmanage import ubuntu22042.ova --vsys 0 --vmname $machine
vboxmanage modifyvm $machine --description $machine
vboxmanage modifyvm $machine --memory 2048
vboxmanage modifyvm $machine --cpus 2
vboxmanage modifyvm $machine --nic1 bridged --bridgeadapter1 wlp2s0
vboxmanage startvm --type headless $machine
sleep 70
ansible all -i "ubuntu22042," -b -m shell -a "hostnamectl set-hostname $machine"
vboxmanage controlvm $machine poweroff
vboxmanage startvm --type headless $machine
