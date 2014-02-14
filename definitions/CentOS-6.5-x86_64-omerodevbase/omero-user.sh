useradd -m -s /bin/bash -p '$6$MI7Tvon5$vtySj.EYJohkALq8/Bq3ot.Oy2KiZOkxQx2GGp3Sbo/2p6Wl3SbZS2pZapmN3XxgyDPBlVUhz1.0ffWZPLJ5T0' omero

mkdir /home/omero/.ssh
chmod 700 /home/omero/.ssh
wget https://raw.github.com/openmicroscopy/openmicroscopy/develop/docs/install/VM/omerovmkey.pub -O /home/omero/.ssh/authorized_keys
chmod 600 /home/omero/.ssh/authorized_keys
chown -R omero:omero /home/omero/.ssh

echo 'omero ALL=(ALL)NOPASSWD:ALL' > /etc/sudoers.d/omero

