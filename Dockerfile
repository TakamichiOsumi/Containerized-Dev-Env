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
# RUN apt -y install libxml2-utils
# RUN apt -y install emacs

# Build documents.
RUN apt install -y docbook-xml docbook-xsl libxml2-utils xsltproc fop

# Create a new user to run regression tests.
RUN useradd -d /home/dev -s /bin/bash dev
RUN mkdir /home/dev && chown dev /home/dev

WORKDIR /workspace/guest_shared
