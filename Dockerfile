FROM jenkins/jenkins:lts-jdk17

# Installer kubectl
USER root
RUN apt-get update && apt-get install -y curl gnupg2
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
  && install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Installer Helm
RUN curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

USER jenkins