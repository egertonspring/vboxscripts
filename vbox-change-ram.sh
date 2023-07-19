# $1 is the machine name and hostname
# $2 is the new value for RAM

machine=$1
newram=$2
vboxmanage controlvm $machine poweroff
vboxmanage modifyvm $machine --memory $newram
vboxmanage startvm --type headless $machine
