FROM ubuntu

WORKDIR /opt/bchacktool
COPY . .

RUN apt update
RUN apt install -y coreutils curl git make
RUN make

ENTRYPOINT ["bchacktool"]
