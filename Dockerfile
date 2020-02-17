FROM debian:10-slim AS download
RUN apt-get update && apt-get install -y curl unzip
WORKDIR /download
RUN curl -o hisat2-220-Linux_x86_64.zip -L https://cloud.biohpc.swmed.edu/index.php/s/hisat2-220-Linux_x86_64/download
RUN unzip hisat2-220-Linux_x86_64.zip

FROM debian:10-slim
COPY --from=download /download/hisat2-2.2.0 /opt/hisat2-2.2.0
ENV PATH=/opt/hisat2-2.2.0:${PATH}
ADD run.sh /
ENTRYPOINT [ "/bin/bash", "/run.sh" ]
