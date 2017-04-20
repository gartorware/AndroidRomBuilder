FROM ubuntu:14.04

MAINTAINER Gartorware <gartorware@gmail.com>

WORKDIR /root
RUN apt-get update \
	&& apt-get install -y software-properties-common python-software-properties wget git-core \
	&& git clone git://github.com/akhilnarang/scripts 
RUN cd scripts \
	&& bash ubuntu1404.sh \
	&& bash install_android_sdk.bash
