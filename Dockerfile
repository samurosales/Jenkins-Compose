FROM jenkins/jenkins:lts

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

USER root 

RUN echo deb http://deb.debian.org/debian stretch-backports main >> /etc/apt/sources.list

RUN echo deb http://deb.debian.org/debian stretch main >> /etc/apt/sources.list

RUN apt-get update

RUN curl -fsSL https://get.docker.com | sh

RUN docker --version 

RUN curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

RUN chmod +x /usr/local/bin/docker-compose

RUN docker-compose --version

RUN /bin/jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt || echo "Some errors occurred during plugin installation."


