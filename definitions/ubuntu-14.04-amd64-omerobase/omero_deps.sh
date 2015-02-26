# Utilities
apt-get -y install unzip git

# OMERO requirements
apt-get -y install \
    python-{imaging,matplotlib,numpy,pip,scipy,tables,virtualenv} \
    openjdk-7-jre-headless \
    ice-services python-zeroc-ice \
    postgresql \
    nginx \

# Remove downloaded packages
apt-get -y clean
