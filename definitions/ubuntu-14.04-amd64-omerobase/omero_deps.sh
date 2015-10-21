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
    gunicorn \

# OMERO Python requirements that are newer than distro versions
pip install "Django>=1.8,<1.9"

# Remove downloaded packages
apt-get -y clean
