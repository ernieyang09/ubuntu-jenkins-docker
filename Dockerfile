FROM ubuntu:18.04

RUN apt update

RUN apt install apt-transport-https ca-certificates curl software-properties-common -y

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

RUN apt update

RUN apt install docker-ce -y

RUN apt install openjdk-8-jdk -y

RUN curl -fsSL https://pkg.jenkins.io/debian/jenkins.io.key | apt-key add -

RUN sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

RUN apt update

RUN apt install jenkins -y

CMD ["java", "-jar", "/usr/share/jenkins/jenkins.war", "--httpPort=8081"]

EXPOSE 8081
