FROM debian:buster

RUN apt-get update \
    && apt-get install -y file \
                          g++ \
                          gcc \
                          gfortran \
                          make \
                          gdb \
                          strace \
                          coreutils \
                          wget \
                          ca-certificates \
                          --no-install-recommends

RUN wget -q http://www.mpich.org/static/downloads/3.1.4/mpich-3.1.4.tar.gz \
    && tar xf mpich-3.1.4.tar.gz \
    && cd mpich-3.1.4 \
    && ./configure --disable-fortran --enable-fast=all,O3 --prefix=/usr \
    && make -j$(nproc) \
    && make install \
    && ldconfig

RUN wget -q http://mvapich.cse.ohio-state.edu/download/mvapich/osu-micro-benchmarks-5.3.2.tar.gz \
    && tar xf osu-micro-benchmarks-5.3.2.tar.gz \
    && cd osu-micro-benchmarks-5.3.2 \
    && ./configure --prefix=/usr/local CC=$(which mpicc) CFLAGS=-O3 \
    && make \
    && make install \
    && cd .. \
    && rm -rf osu-micro-benchmarks-5.3.2 \
    && rm osu-micro-benchmarks-5.3.2.tar.gz

WORKDIR /usr/local/libexec/osu-micro-benchmarks/mpi/pt2pt
CMD ["mpiexec", "-n", "2", "-bind-to", "core", "./osu_bw"]

