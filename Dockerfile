FROM ubuntu:24.04

RUN apt update

RUN apt -y install build-essential
RUN apt -y install git=1:2.43.0-1ubuntu7.1 \
		   flex=2.6.4-8.2build1 \
		   bison=2:3.8.2+dfsg-1build2 \
		   libreadline-dev=8.2-4build1 \
		   zlib1g-dev=1:1.3.dfsg-3.1ubuntu2 \
		   curl=8.5.0-2ubuntu10.1 \
		   libicu-dev=74.2-1ubuntu3 \
		   pkgconf=1.8.1-2build1

WORKDIR /workspace
