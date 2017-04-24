FROM ubuntu:16.04

MAINTAINER Gartorware <gartorware@gmail.com>

WORKDIR /root

ENV SOURCE_DIR=$WORKDIR/AICP 

# Install core tools
RUN apt-get update && apt-get install -y \
	software-properties-common python-software-properties \
	wget git-core nano bsdmainutils sudo \
	&& rm -rf /var/lib/apt/lists/*

# Setup build environment
RUN git clone git://github.com/akhilnarang/scripts \
	&& cd scripts \
	&& bash setup/ubuntu1604linuxmint18.sh \
	&& bash setup/install_android_sdk.bash \
	&& cd $WORKDIR \
	&& echo "export USER=\$(whoami)" >> .bashrc \
	&& echo "export USE_CCACHE=1" >> .bashrc  \
	&& echo "CCACHE_DIR=\${SOURCE_DIR}/.ccache" >> .bashrc \
	&& echo "ccache -M 25 >/dev/null" >> .bashrc \
	&& echo "export JACK_SERVER_VM_ARGUMENTS=\"-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4g\"" >> .bashrc \
	&& rm -rf /var/lib/apt/lists/* 
