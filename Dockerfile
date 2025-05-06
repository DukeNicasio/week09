FROM jenkins/jenkins:lts

USER root

RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g firebase-tools

RUN apt-get update && apt-get install -y docker.io

RUN usermod -aG docker jenkins

USER jenkins