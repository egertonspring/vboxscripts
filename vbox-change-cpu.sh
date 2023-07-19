# $1 is the machine name and hostname
# $2 is the new value for CPUs


machine=$1
newcpu=$2
vboxmanage controlvm $machine poweroff
vboxmanage modifyvm $machine --cpus $newcpu
vboxmanage startvm --type headless $machine
