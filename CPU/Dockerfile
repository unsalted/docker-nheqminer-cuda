FROM ubuntu:16.04
LABEL maintainer "Unsalted"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
  ca-certificates \
  build-essential \
  wget \
  g++ \
  git \
  cmake \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean -y

WORKDIR /tmp

# set boost envs
ARG boost_version=1.62.0
ARG boost_dir=boost_1_62_0
ARG boost_sha256_sum=440a59f8bc4023dbe6285c9998b0f7fa288468b889746b1ef00e8b36c559dce1
ENV boost_version ${boost_version}

ARG boost_libs=" \
  --with-atomic \
  --with-chrono \
  --with-date_time \
  --with-filesystem \
  --with-log \
  --with-regex \
  --with-system \
  --with-thread

# install boost
RUN wget http://downloads.sourceforge.net/project/boost/boost/${boost_version}/${boost_dir}.tar.gz \
  && echo "${boost_sha256_sum}  ${boost_dir}.tar.gz" | sha256sum -c \
  && tar xfz ${boost_dir}.tar.gz \
  && rm ${boost_dir}.tar.gz \
  && cd ${boost_dir} \
  && ./bootstrap.sh --prefix=/usr \
  && ./b2 -j 4 stage $boost_libs \
  && ./b2 -j 4 install $boost_libs \
  && cd .. && rm -rf ${boost_dir} && ldconfig

# install nicehash
RUN git clone https://github.com/nicehash/nheqminer.git \
  && chmod +x nheqminer/cpu_xenoncat/asm_linux/* \
  && cd nheqminer/cpu_xenoncat/asm_linux \
  && sh assemble.sh \
  && cd /tmp \
  && mkdir build/ \
  && cd build/ \
  && cmake -DUSE_CUDA_DJEZO=OFF ../nheqminer \
  && make -j $(nproc) \
  && cp ./nheqminer /usr/local/bin/nheqminer

RUN rm -rf /tmp/*
RUN useradd -ms /bin/bash nheqminer
USER nheqminer
WORKDIR /home/nheqminer

ENTRYPOINT ["/usr/local/bin/nheqminer"]
CMD ["-h"]
