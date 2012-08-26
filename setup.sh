#!/bin/bash
# You may also want https://github.com/rodjek/vim-puppet 
# There a packages for it in Ubuntu if you wish

set -e

tmpdir='/tmp/puppetinstall'
pupfile=puppetlabs-release-$( grep DISTRIB_CODENAME /etc/lsb-release | cut -d= -f2 ).deb



[[ ! -d $tmpdir ]] && mkdir $tmpdir
cd $tmpdir

if [[ ! -f $pupfile ]]; then
  wget http://apt.puppetlabs.com/$pupfile
fi
sudo dpkg -i $pupfile
sudo apt-get install puppet rubygems lxc rubygems
sudo gem install puppetlabs_spec_helper

