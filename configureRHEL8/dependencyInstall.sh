#!/bin/bash

# Enable the repo
sudo subscription-manager repos --enable codeready-builder-for-rhel-8-x86_64-rpms

sudo dnf -y install re2c readline-devel
sudo dnf -y install libxml2-devel pcre-devel libtirpc-devel
sudo dnf -y install libusbx-devel libXext-devel libjpeg-devel perl-devel
sudo dnf -y install git wget tar make cmake gcc gcc-c++ pkgconfig
sudo dnf -y install libraw1394 boost-devel libusb-devel rpcgen
sudo dnf -y install net-snmp-devel
wget https://download-ib01.fedoraproject.org/pub/epel/8/Everything/x86_64/Packages/e/epel-release-8-10.el8.noarch.rpm
sudo rpm -Uvh epel-release*rpm
sudo dnf -y install zeromq-devel
rm *.rpm
