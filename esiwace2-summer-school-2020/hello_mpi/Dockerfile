FROM debian:buster

RUN apt-get update && apt-get install -y \
        build-essential             \
        wget                        \
        ca-certificates             \
        --no-install-recommends     \
    && rm -rf /var/lib/apt/lists/*


RUN wget -q http://www.mpich.org/static/downloads/3.1.4/mpich-3.1.4.tar.gz \
    && tar xf mpich-3.1.4.tar.gz \
    && cd mpich-3.1.4 \
    && ./configure --disable-fortran --enable-fast=all,O3 --prefix=/usr \
    && make -j$(nproc) \
    && make install \
    && ldconfig \
    && cd .. \
    && rm -rf mpich-3.1.4 \
    && rm mpich-3.1.4.tar.gz

COPY . /hello_mpi

RUN cd /hello_mpi && make
