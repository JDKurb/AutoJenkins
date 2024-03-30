FROM bitnami/jenkins:2.440.2-debian-12-r0

COPY jenkins.yaml $JENKINS_HOME/jenkins.yaml

COPY build-deploy.xml /usr/share/jenkins/ref/jobs/build-deploy/config.xml