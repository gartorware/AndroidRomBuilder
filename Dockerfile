FROM ubuntu:14.04

MAINTAINER Gartorware <gartorware@gmail.com>

WORKDIR /root

# Install core tools
RUN apt-get update \
	&& apt-get install -y software-properties-common python-software-properties wget git-core nano bsdmainutils

# Setup build environment
RUN git clone git://github.com/akhilnarang/scripts \
	&& cd scripts \
	&& bash ubuntu1404.sh \
	&& bash install_android_sdk.bash
