FROM ubuntu:18.04
MAINTAINER wade <wadeling@gmail.com>
#resolv debconf: unable to initialize frontend: Dialog
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
#others
apt-get install -y build-essential \
apt-utils \
unzip \
git \
make \
cmake \
automake \
autoconf \
libtool \
virtualenv \
python \
vim \
g++ \
wget \
ninja-build \
curl \
lsb-core \
software-properties-common && \
#use bazelisk to avoid bazel compatibility issue
wget -O /usr/local/bin/bazel https://github.com/bazelbuild/bazel/releases/download/1.1.0/bazel-1.1.0-linux-x86_64 && \
chmod +x /usr/local/bin/bazel && \
#golang
curl -LO https://dl.google.com/go/go1.13.5.linux-amd64.tar.gz && \
tar -C /usr/local -xzf go1.13.5.linux-amd64.tar.gz && \
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc  && \
echo 'export PATH=$PATH:/root/go/bin' >> ~/.bashrc  && \
echo 'export GOPATH=$HOME/go' >> ~/.bashrc  && \
# go relative
/usr/local/go/bin/go get -u github.com/bazelbuild/buildtools/buildifier && \
echo 'export BUILDIFIER_BIN=$GOPATH/bin/buildifier' >> ~/.bashrc  && \
/usr/local/go/bin/go get -u github.com/bazelbuild/buildtools/buildozer && \
echo 'export BUILDOZER_BIN=$GOPATH/bin/buildozer' >> ~/.bashrc  

COPY ./setup_clang.sh /
RUN ./setup_clang.sh

ENTRYPOINT ["/bin/bash"]
