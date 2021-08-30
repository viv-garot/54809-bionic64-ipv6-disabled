apt-get clean 
apt-get update 

apt-get upgrade -y 
apt-get dist-upgrade -y

# Update to the latest kernel
apt-get install -y linux-generic linux-image-generic

# basic tools
apt-get install -y  \
	git vim curl wget jq tar unzip software-properties-common net-tools \
	language-pack-en ctop htop sysstat 

# Hide Ubuntu splash screen during OS Boot, so you can see if the boot hangs
apt-get remove -y plymouth-theme-ubuntu-text
sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="quiet"/GRUB_CMDLINE_LINUX_DEFAULT="ipv6.disable=1"/' /etc/default/grub
sed -i 's/GRUB_CMDLINE_LINUX=""/GRUB_CMDLINE_LINUX="ipv6.disable=1"/' /etc/default/grub
update-grub

# Reboot with the new kernel
shutdown -r now
