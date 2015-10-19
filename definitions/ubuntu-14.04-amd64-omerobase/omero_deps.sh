# Utilities
apt-get -y install unzip git

# OMERO requirements
apt-get -y install \
    python-imaging \
    python-matplotlib \
    python-numpy \
    python-pip \
    python-scipy \
    python-tables \
    python-virtualenv \
    openjdk-7-jre-headless \
    ice-services python-zeroc-ice \
    postgresql \
    nginx \

# OMERO Python requirements that are newer than distro versions
pip install django

# Remove downloaded packages
apt-get -y clean
