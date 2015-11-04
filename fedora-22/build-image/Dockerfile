FROM alanfranz/fwd-fedora-22:latest
MAINTAINER Alan Franzoni <username@franzoni.eu>
ARG RAKE_VERSION
ARG RUBY_VERSION
ARG MAJOR
ARG MINOR
RUN yum clean metadata ; yum -y install curl git openssl-devel readline-devel zlib-devel
RUN git config --global user.name "autobuild" ; git config --global user.email "autobuild@example.com"
RUN git clone https://github.com/sstephenson/ruby-build.git ~/ruby-build ; cd ~/ruby-build ; ./install.sh
RUN ruby-build ${RUBY_VERSION} /opt/rake-standalone/${MAJOR}.${MINOR}
