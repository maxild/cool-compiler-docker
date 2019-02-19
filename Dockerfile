#
# cs164 -- cool compiler developer environment -- Dockerfile
#

# 32 bit Ubuntu required by cs164 course (to run SIMP)
FROM i386/ubuntu:latest
LABEL authors="Morten Maxild <mmaxild@gmail.com>"

# https://lagunita.stanford.edu/courses/Engineering/Compilers/Fall2014/6b750292e90d4950b895f621a5671b49/
#    flex: fast lexical analyzer generator
#    bison: YACC-compatible parser generator
#    build-essential: Informational list of build-essential packages (dpkg-dev, g++, gcc, libc6-dev/libc-dev, make)
#    csh: Shell with C-like syntax
#    openjdk-6-jdk: TODO: Only openjdk-11-jdk is present
#    libxaw7-dev: X11 Athena Widget library
RUN buildDeps=" \
    wget \
    curl \
    tar \
    flex \
    bison \
    man \
    git \
    build-essential \
    csh \
    libxaw7-dev \
    "; \
    apt-get update && apt-get -y upgrade && apt-get install -y --no-install-recommends $buildDeps

# TODO: better install 32-bit ubuntu (see above)
#RUN apt-get install lib32z1 lib32ncurses5 lib32bz2-1.0 lib32stdc++6
#RUN apt-get install lib32z1 lib32ncurses5 lib32bz2-1.0

# APT cleanup to reduce image size
#    When you run 'apt-get update', a list of packages will get downloaded from the Ubuntu servers. These
#    files are then stored in /var/lib/apt/lists/. You can safely remove the contents of that directory as
#    it is recreated when you refresh the package lists. If you remove the files, but do not run apt-get update
#    to fetch the lists, commands like apt-cache will fail to provide information (since the cache is empty).
RUN rm -rf /var/lib/apt/lists/*

# Add files.
ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
ADD root/.scripts /root/.scripts

# Set environment variables.
ENV HOME /root

WORKDIR /root
ENTRYPOINT /bin/bash
