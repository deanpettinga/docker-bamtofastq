FROM centos:7

RUN yum update -y && \
    yum install -y which && \
    yum install -y wget && \
    yum install -y bzip2 && \
    yum install -y git && \
    yum install -y make && \
    yum install -y cmake && \
    yum install -y gcc && \
    yum install -y zlib-devel && \
    yum install -y bzip2-devel && \
    yum install -y xz-devel && \
    yum install -y epel-release && \
    yum install -y centos-release-scl && \
    yum install -y rust-toolset-7 && \
    yum install -y cargo && \
    yum install -y devtoolset-7


RUN yum-config-manager --enable llvm-toolset-7 && \
    scl enable llvm-toolset-7 bash

RUN git clone https://github.com/10XGenomics/bamtofastq && \
    cd bamtofastq && \
    cargo build --release

ENV PATH="/bamtofastq/target/release/:${PATH}"
