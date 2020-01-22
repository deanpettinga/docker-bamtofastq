FROM centos:7

RUN yum update -y && \
    yum install -y which \
                   wget \
                   bzip2 \
                   git \
                   make \
                   cmake \
		   rust \
		   gcc \
		   zlib-devel \
		   bzip2-devel \
		   xz-devel \
		   epel-release \
		   centos-release-scl \
		   llvm-toolset-7 \
		   cargo

RUN git clone https://github.com/10XGenomics/bamtofastq && \
		cd bamtofastq && \
		cargo build --release

ENV PATH="/bamtofastq/target/release/:${PATH}"
