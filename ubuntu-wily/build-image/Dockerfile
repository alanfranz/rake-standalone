FROM alanfranz/fwd-ubuntu-wily:latest
MAINTAINER Alan Franzoni <username@franzoni.eu>
ARG MAJOR
ARG MINOR
ARG RUBY_VERSION
ARG RAKE_VERSION
RUN apt-get -y update && apt-get -y install git curl libssl-dev libreadline-dev zlib1g-dev
RUN git config --global user.name "autobuild" ; git config --global user.email "autobuild@example.com"
RUN git clone https://github.com/sstephenson/ruby-build.git ~/ruby-build ; cd ~/ruby-build ; ./install.sh
RUN ruby-build ${RUBY_VERSION} /opt/rake-standalone/${MAJOR}.${MINOR}
