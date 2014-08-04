A Chef cookbook for SIGVerse Server.
====================================

## how to install SIGVerse Server by using this cookbook ##

### necessary softwares ###

- [Vagrant](http://www.vagrantup.com)
- [VirtualBox](https://www.virtualbox.org)
- [Chef DK](http://downloads.getchef.com/chef-dk/)

The following Vagrant plugin are also needed.

- Vagrant Berkshelf plugin
- Vagrant Omnibus plugin

### how to install ###

1. Install Vagrant, VirtualBox, and Chef DK.
2. (For Windows only) Add the VirtualBox install path (usually C:¥Program Files¥Oracle¥VirtualBox) to PATH environment variables.
3. Open the terminal, and install the Vagrant plugins as follows:
    - vagrant plugin install vagrant-berkshelf
    - vagrant plugin install vagrant-omnibus
4. Checkout this cookbook.
5. Open the terminal, and execute "vagrant up" in this cookbook directory.
