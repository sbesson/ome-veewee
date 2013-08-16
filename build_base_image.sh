#!/bin/bash
# Build the OMERo base VirtualBox image using Veewee.
# Example: ./build_base_image.sh Debian-7.1.0-amd64-omerobase

set -e -x

if [ $# -ne 1 ]; then
	echo Usage: `basename $0` base_definition_name
	exit 1
fi

if [ -d "$HOME/Library/VirtualBox" ]; then
	HARDDISKS=${HARDDISKS:-"$HOME/Library/VirtualBox/HardDisks/"}
elif [ -e "$HOME/.VirtualBox" ]; then
	export HARDDISKS=${HARDDISKS:-"$HOME/.VirtualBox/HardDisks/"}
else
	echo "Cannot find harddisks! Trying setting HARDDISKS"
	exit 2
fi

BASEBOX=$1
BUILD_NUMBER={BUILD_NUMBER:-DEV}
KEEP_VM=0

. ~/.rvm/scripts/rvm
rvm use 1.9.2
bundle install

bundle exec veewee vbox build "$BASEBOX"
bundle exec veewee vbox halt "$BASEBOX"

