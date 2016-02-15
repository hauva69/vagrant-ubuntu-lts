#!/bin/sh

apt-get update
apt-get install -y build-essential \
	emacs24-nox \
	git \
	language-pack-en \
	language-pack-fi \
	vim-nox

if [ ! -e '/usr/local/sbin/godeb' ] ; then
    wget -O godeb-amd64.tar.gz https://godeb.s3.amazonaws.com/godeb-amd64.tar.gz
    tar zxf godeb-amd64.tar.gz
    mv godeb /usr/local/sbin/
    rm -f godeb-amd64.tar.gz
fi

if [ ! -e '/usr/bin/go' ] ; then
    godeb install
fi
