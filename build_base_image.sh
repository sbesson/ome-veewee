#!/bin/bash
# Build the OMERo base VirtualBox image using Veewee.
# Example: ./build_base_image.sh Debian-7.1.0-amd64-omerobase

set -e -x

if [ $# -ne 1 ]; then
	echo Usage: `basename $0` base_definition_name
	exit 1
fi

if [ -d "$HOME/VirtualBox VMs/" ]; then
	VBOXVMS="$HOME/VirtualBox VMs/"
else
	echo "Cannot find VirtualBox VMs directory"
	exit 2
fi

BASEBOX=$1
BUILD_NUMBER={BUILD_NUMBER:-DEV}
KEEP_VM=0

. ~/.rvm/scripts/rvm
rvm use 1.9.2
bundle install

bundle exec veewee vbox build --force "$BASEBOX"
bundle exec veewee vbox halt "$BASEBOX"

SOURCE="$VBOXVMS/${BASE_DEFINITION}/${BASE_DEFINITION}.vdi"
DEST="$PWD/${BASE_DEFINITION}-b{$BUILD_NUMBER}.vdi"

if [ $KEEP_VM -eq 0 ]; then
	cp "$SOURCE" "$DEST"
	bundle exec veewee vbox destroy "$BASEBOX"
else
	VBoxManage clonehd "$SOURCE" "$DEST"
fi

echo "Base image: $DEST"

