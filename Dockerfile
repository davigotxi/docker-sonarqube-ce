## This is the 7.9 LTS version
# https://github.com/SonarSource/docker-sonarqube/blob/62bf9864e14e439dcd0019e3205668d62f623169/7/community/Dockerfile
FROM sonarqube:7.9-community

USER root
## As per instructions https://github.com/mc1arke/sonarqube-community-branch-plugin
ADD https://github.com/mc1arke/sonarqube-community-branch-plugin/releases/download/1.3.0/sonarqube-community-branch-plugin-1.3.0.jar /opt/sonarqube/extensions/plugins/
RUN cp /opt/sonarqube/extensions/plugins/sonarqube-community-branch-plugin-1.3.0.jar /opt/sonarqube/lib/common/ \
    && chown -R sonarqube:sonarqube /opt/sonarqube

USER sonarqube

ENTRYPOINT ["./bin/run.sh"]
