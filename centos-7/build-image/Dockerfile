FROM alanfranz/fwd-centos-7:latest
MAINTAINER Alan Franzoni <username@franzoni.eu>
RUN yum clean metadata ; yum -y install curl git openssl-devel readline-devel zlib-devel
RUN git config --global user.name "autobuild" ; git config --global user.email "autobuild@example.com"
ENV MAJOR="1" MINOR="0" RUBY_VERSION="2.2.3"
RUN git clone https://github.com/sstephenson/ruby-build.git ~/ruby-build ; cd ~/ruby-build ; ./install.sh
RUN ruby-build ${RUBY_VERSION} /opt/rake-standalone/${MAJOR}.${MINOR}
