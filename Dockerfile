FROM ubuntu

WORKDIR /tmp/bchacktool3

COPY . .
RUN apt update && apt install -y make awk git 
RUN make install

WORKDIR /root

ENTRYPOINT /bin/bash