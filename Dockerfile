FROM jenkins/jenkins:lts

USER root

# ติดตั้ง Docker CLI
RUN apt-get update && apt-get install -y \
    docker.io \
    curl \
    gnupg \
    ca-certificates

# ติดตั้ง Node.js v20
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs

# ติดตั้ง Firebase CLI
RUN npm install -g firebase-tools

# ให้ user 'jenkins' ใช้ docker ได้
RUN usermod -aG docker jenkins

USER jenkins
