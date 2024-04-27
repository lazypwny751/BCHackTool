FROM ubuntu

WORKDIR "/opt/bchacktool"
COPY . .
RUN ["apt", "update"]
RUN ["apt", "install", "-y", "git"]
RUN ["bash", "build.sh"]

ENTRYPOINT ["bash", "bchacktool.sh"]
