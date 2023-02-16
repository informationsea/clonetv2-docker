FROM debian:bookworm-slim AS donwload-samtools
RUN apt-get update && apt-get install -y curl bzip2 && rm -rf /var/lib/apt/lists/*
RUN curl -OL https://github.com/samtools/samtools/releases/download/1.16.1/samtools-1.16.1.tar.bz2
RUN tar xjf samtools-1.16.1.tar.bz2

FROM debian:bookworm-slim AS samtools-build
RUN apt-get update && apt-get install -y libssl-dev libncurses-dev build-essential zlib1g-dev liblzma-dev libbz2-dev curl libcurl4-openssl-dev
COPY --from=donwload-samtools /samtools-1.16.1 /build
WORKDIR /build
RUN ./configure --prefix /opt/samtools && make -j4 && make install

FROM r-base:4.2.2
RUN apt-get update && \
    apt-get install -y libcurl4-openssl-dev libssl-dev libxml2-dev default-jdk devscripts && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN mkdir -p /root/.checkpoint
WORKDIR /work
COPY install.R /work/
RUN Rscript install.R 2>&1 | tee /install-log.txt
COPY aseq /opt/aseq
COPY --from=samtools-build /opt/samtools /opt/samtools
ENV PATH=/opt/aseq/binaries/linux64:/opt/samtools/bin:${PATH}