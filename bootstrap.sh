#!/bin/sh

apt-get update
apt-get install -y build-essential \
	emacs24-nox \
	git \
	language-pack-en \
	language-pack-fi \
	vim-nox \
	python-pip
apt-get upgrade -y

pip install awscli

if [ ! -e '/usr/local/sbin/godeb' ] ; then
    wget -O godeb-amd64.tar.gz https://godeb.s3.amazonaws.com/godeb-amd64.tar.gz
    tar zxf godeb-amd64.tar.gz
    mv godeb /usr/local/sbin/
    rm -f godeb-amd64.tar.gz
fi

if [ ! -e '/usr/bin/go' ] ; then
    /usr/local/sbin/godeb install
fi

if [ ! -e '/home/vagrant/.nvm' ] ; then
    /usr/bin/sudo -i -u vagrant /usr/bin/curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | /usr/bin/sudo -i -u vagrant bash
fi
