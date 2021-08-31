# bionic64-ipv6-disabled

## Description
Create a Vagrant ubuntu based box with ipv6 disabled via Packer

## Pre-requirements

* [Packer](https://www.packer.io/downloads)
* [Vagrant](https://www.vagrantup.com/downloads)
* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)

## How to use this repo

- Clone
- Build
- Vagrant usage
- Publish
- Consume 

---

### Clone the repo

```
git clone https://github.com/viv-garot/bionic64-ipv6-disabled
```

### Change directory

```
cd bionic64-ipv6-disabled
```

### Check the scripts/packages.sh file

Observe how ipv6 is disabled via the last commands in this file

```
sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="quiet"/GRUB_CMDLINE_LINUX_DEFAULT="ipv6.disable=1"/' /etc/default/grub
sed -i 's/GRUB_CMDLINE_LINUX=""/GRUB_CMDLINE_LINUX="ipv6.disable=1"/' /etc/default/grub
update-grub

# Reboot with the new kernel
shutdown -r now
```

### Build the box with Packer

```
packer build bionic64-ipv6-disabled.json
```

_sample_

```
packer build bionic64-ipv6-disabled.json
bionic64-ipv6-disabled-vbox: output will be in this color.

==> bionic64-ipv6-disabled-vbox: Retrieving Guest additions
==> bionic64-ipv6-disabled-vbox: Trying /Applications/VirtualBox.app/Contents/MacOS/VBoxGuestAdditions.iso
==> bionic64-ipv6-disabled-vbox: Trying /Applications/VirtualBox.app/Contents/MacOS/VBoxGuestAdditions.iso
==> bionic64-ipv6-disabled-vbox: /Applications/VirtualBox.app/Contents/MacOS/VBoxGuestAdditions.iso => /Applications/VirtualBox.app/Contents/MacOS/VBoxGuestAdditions.iso
==> bionic64-ipv6-disabled-vbox: Retrieving ISO
==> bionic64-ipv6-disabled-vbox: Trying https://cdimage.ubuntu.com/releases/18.04/release/ubuntu-18.04.5-server-amd64.iso
==> bionic64-ipv6-disabled-vbox: Trying https://cdimage.ubuntu.com/releases/18.04/release/ubuntu-18.04.5-server-amd64.iso?checksum=sha256%3A8c5fc24894394035402f66f3824beb7234b757dd2b5531379cb310cedfdf0996
    bionic64-ipv6-disabled-vbox: ubuntu-18.04.5-server-amd64.iso 951.00 MiB / 951.00 MiB [===================================] 100.00% 1m11s
==> bionic64-ipv6-disabled-vbox: https://cdimage.ubuntu.com/releases/18.04/release/ubuntu-18.04.5-server-amd64.iso?checksum=sha256%3A8c5fc24894394035402f66f3824beb7234b757dd2b5531379cb310cedfdf0996 => /Users/viviengarot/Desktop/VisualCode/skillsmap/Packer/bionic64-ipv6-disabled/packer_cache/a37af95ab12e665ba168128cde2f3662740b21a2.iso
==> bionic64-ipv6-disabled-vbox: Starting HTTP server on port 8010
==> bionic64-ipv6-disabled-vbox: Creating virtual machine...
==> bionic64-ipv6-disabled-vbox: Creating hard drive output-bionic64-ipv6-disabled-vbox/bionic64-ipv6-disabled.vdi with size 102000 MiB...
==> bionic64-ipv6-disabled-vbox: Mounting ISOs...
    bionic64-ipv6-disabled-vbox: Mounting boot ISO...
==> bionic64-ipv6-disabled-vbox: Creating forwarded port mapping for communicator (SSH, WinRM, etc) (host port 2247)
==> bionic64-ipv6-disabled-vbox: Executing custom VBoxManage commands...
    bionic64-ipv6-disabled-vbox: Executing: modifyvm bionic64-ipv6-disabled --memory 2048
    bionic64-ipv6-disabled-vbox: Executing: modifyvm bionic64-ipv6-disabled --cpus 2
    bionic64-ipv6-disabled-vbox: Executing: modifyvm bionic64-ipv6-disabled --nic1 nat
    bionic64-ipv6-disabled-vbox: Executing: modifyvm bionic64-ipv6-disabled --natpf1 guest_http,tcp,,6969,,80
==> bionic64-ipv6-disabled-vbox: Starting the virtual machine...
    bionic64-ipv6-disabled-vbox: The VM will be run headless, without a GUI. If you want to
    bionic64-ipv6-disabled-vbox: view the screen of the VM, connect via VRDP without a password to
    bionic64-ipv6-disabled-vbox: rdp://127.0.0.1:5927
==> bionic64-ipv6-disabled-vbox: Waiting 5s for boot...
==> bionic64-ipv6-disabled-vbox: Typing the boot command...
==> bionic64-ipv6-disabled-vbox: Using SSH communicator to connect: 127.0.0.1
==> bionic64-ipv6-disabled-vbox: Waiting for SSH to become available...
    
[...]

==> bionic64-ipv6-disabled-vbox: Gracefully halting virtual machine...
==> bionic64-ipv6-disabled-vbox: Preparing to export machine...
    bionic64-ipv6-disabled-vbox: Deleting forwarded port mapping for the communicator (SSH, WinRM, etc) (host port 2247)
==> bionic64-ipv6-disabled-vbox: Exporting virtual machine...
    bionic64-ipv6-disabled-vbox: Executing: export bionic64-ipv6-disabled --output output-bionic64-ipv6-disabled-vbox/bionic64-ipv6-disabled.ovf
==> bionic64-ipv6-disabled-vbox: Cleaning up floppy disk...
==> bionic64-ipv6-disabled-vbox: Deregistering and deleting VM...
==> bionic64-ipv6-disabled-vbox: Running post-processor: vagrant
==> bionic64-ipv6-disabled-vbox (vagrant): Creating a dummy Vagrant box to ensure the host system can create one correctly
==> bionic64-ipv6-disabled-vbox (vagrant): Creating Vagrant box for 'virtualbox' provider
    bionic64-ipv6-disabled-vbox (vagrant): Copying from artifact: output-bionic64-ipv6-disabled-vbox/bionic64-ipv6-disabled-disk001.vmdk
    bionic64-ipv6-disabled-vbox (vagrant): Copying from artifact: output-bionic64-ipv6-disabled-vbox/bionic64-ipv6-disabled.ovf
    bionic64-ipv6-disabled-vbox (vagrant): Renaming the OVF to box.ovf...
    bionic64-ipv6-disabled-vbox (vagrant): Compressing: Vagrantfile
    bionic64-ipv6-disabled-vbox (vagrant): Compressing: bionic64-ipv6-disabled-disk001.vmdk
    bionic64-ipv6-disabled-vbox (vagrant): Compressing: box.ovf
    bionic64-ipv6-disabled-vbox (vagrant): Compressing: metadata.json
Build 'bionic64-ipv6-disabled-vbox' finished after 11 minutes 42 seconds.

==> Wait completed after 11 minutes 42 seconds

==> Builds finished. The artifacts of successful builds are:
--> bionic64-ipv6-disabled-vbox: VM files in directory: output-bionic64-ipv6-disabled-vbox
--> bionic64-ipv6-disabled-vbox: 'virtualbox' provider box: bionic64-ipv6-disabled-vbox.box
```

### How to use the box with Vagrant

#### Add the box to Vagrant

```
vagrant box add --name bionic64-ipv6-disabled bionic64-ipv6-disabled-vbox.box
```

#### Initialize the box to create a VagrantFile

```
vagrant init -m bionic64-ipv6-disabled
```

#### Start the box

```
vagrant up
```

### Confirm ipv6 is disabled

```
vagrant ssh -c "ip add"
```

_sample_

```
vagrant ssh -c "ip add"
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 08:00:27:53:cd:48 brd ff:ff:ff:ff:ff:ff
    inet 10.0.2.15/24 brd 10.0.2.255 scope global dynamic enp0s3
       valid_lft 86377sec preferred_lft 86377sec
Connection to 127.0.0.1 closed.
```

### Run the provider download script

```
bash /vagrant/curl.sh
ls out/
```

_sample_

```
ls out
curl-v-01-rc0.log  curl-v-05.log      curl-v-10-rc0.log  curl-v-14.log      curl-v-19-rc0.log    curl-v-I-04.log      curl-v-I-09-rc0.log  curl-v-I-13.log      curl-v-I-18-rc0.log
curl-v-01.log      curl-v-06-rc0.log  curl-v-10.log      curl-v-15-rc0.log  curl-v-19.log        curl-v-I-05-rc0.log  curl-v-I-09.log      curl-v-I-14-rc0.log  curl-v-I-18.log
curl-v-02-rc0.log  curl-v-06.log      curl-v-11-rc0.log  curl-v-15.log      curl-v-I-01-rc0.log  curl-v-I-05.log      curl-v-I-10-rc0.log  curl-v-I-14.log      curl-v-I-19-rc0.log
curl-v-02.log      curl-v-07-rc0.log  curl-v-11.log      curl-v-16-rc0.log  curl-v-I-01.log      curl-v-I-06-rc0.log  curl-v-I-10.log      curl-v-I-15-rc0.log  curl-v-I-19.log
curl-v-03-rc0.log  curl-v-07.log      curl-v-12-rc0.log  curl-v-16.log      curl-v-I-02-rc0.log  curl-v-I-06.log      curl-v-I-11-rc0.log  curl-v-I-15.log
curl-v-03.log      curl-v-08-rc0.log  curl-v-12.log      curl-v-17-rc0.log  curl-v-I-02.log      curl-v-I-07-rc0.log  curl-v-I-11.log      curl-v-I-16-rc0.log
curl-v-04-rc0.log  curl-v-08.log      curl-v-13-rc0.log  curl-v-17.log      curl-v-I-03-rc0.log  curl-v-I-07.log      curl-v-I-12-rc0.log  curl-v-I-16.log
curl-v-04.log      curl-v-09-rc0.log  curl-v-13.log      curl-v-18-rc0.log  curl-v-I-03.log      curl-v-I-08-rc0.log  curl-v-I-12.log      curl-v-I-17-rc0.log
curl-v-05-rc0.log  curl-v-09.log      curl-v-14-rc0.log  curl-v-18.log      curl-v-I-04-rc0.log  curl-v-I-08.log      curl-v-I-13-rc0.log  curl-v-I-17.log
```


### Destroy the box

```
vagrant destroy
```

### Remove the box

```
vagrant box remove bionic64-ipv6-disabled
```


## Publish to Vagrant Cloud

### Login to Vagrant Cloud

```
vagrant cloud auth login
```

*Note : If you have Two-Factor authentication enabled the login will fail with the bellow error*
```
 - Two-factor authentication is enabled! Vagrant Cloud does not support creating (VagrantCloud::Error::ClientError::RequestError)
access tokens via the API when the user has two-factor authentication
enabled. Please create an access token using the Vagrant Cloud website and store
the result in the 'ATLAS_TOKEN' environment variable.
```

*- Create a token in Vagrant Cloud if not performed already*

![image](https://user-images.githubusercontent.com/85481359/124562546-6f819000-de3f-11eb-9609-8c5ed40dc159.png)

*- And export the result in the 'ATLAS_TOKEN' environment variable*

```
export ATLAS_TOKEN=<generated-token>
```

*- Then try again to login*

```
vagrant cloud auth login
```

### Create the box in Vagrant Cloud

```
vagrant cloud box create <user>/<box> --no-private
```
e.g.
```
vagrant cloud box create vivien/bionic64-ipv6-disabled --no-private
```

### Publish the box to Vagrant Cloud

```
vagrant cloud publish --box-version `date +%y.%m.%d` \
  --force --no-private --release <user>/<box>   \
  `date +%y.%m.%d` virtualbox bionic64-ipv6-disabled-vbox.box
```

e.g.
```
vagrant cloud publish --box-version `date +%y.%m.%d` \
  --force --no-private --release vivien/bionic64-ipv6-disabled   \
  `date +%y.%m.%d` virtualbox bionic64-ipv6-disabled-vbox.box
```

## Consume the box from the Vagrant Cloud

### Create a sub directory

```
mkdir myboxes
```

### Change directory

```
cd myboxes
```

### Initialize the box to create a VagrantFile

```
vagrant init -m <user>/<box>
```

e.g.
```
vagrant init -m vivien/bionic64-ipv6-disabled
```

### Start the box

```
vagrant up
```
