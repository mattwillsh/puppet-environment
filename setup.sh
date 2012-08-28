#!/bin/bash
# You may also want https://github.com/rodjek/vim-puppet 
# There a packages for it in Ubuntu if you wish


set -e

tmpdir='/tmp/puppetinstall'
pupfile=puppetlabs-release-$( grep DISTRIB_CODENAME /etc/lsb-release | cut -d= -f2 ).deb



[[ ! -d $tmpdir ]] && mkdir $tmpdir
pushd $tmpdir

if [[ ! -f $pupfile ]]; then
  wget http://apt.puppetlabs.com/$pupfile
fi
sudo dpkg -i $pupfile
popd
sudo apt-get install puppet rubygems  
sudo gem install puppetlabs_spec_helper


# Set up LXC for CentOS
sudo apt-get install yum lxc 
sudo cp lxc-centos /usr/lib/lxc/templates
echo "Remember to add %_dbpath  %{_var}/lib/rpm to your .rpmmacros file"


