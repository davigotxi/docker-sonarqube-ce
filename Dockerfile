## This is the 9.4 LTS version
FROM sonarqube:9.4-community

USER root
## As per instructions https://github.com/mc1arke/sonarqube-community-branch-plugin/tree/1.11.0
# 1. Copy the plugin JAR file to the extensions/plugins/ directory of your SonarQube instance
ADD --chown=sonarqube:sonarqube https://github.com/mc1arke/sonarqube-community-branch-plugin/releases/download/1.11.0/sonarqube-community-branch-plugin-1.11.0.jar /opt/sonarqube/extensions/plugins/

# 2. Add -javaagent:./extensions/plugins/sonarqube-community-branch-plugin-${version}.jar=web to the sonar.web.javaAdditionalOpts property in your Sonarqube installation's config/sonar.properties file, e.g. sonar.web.javaAdditionalOpts=-javaagent:./extensions/plugins/sonarqube-community-branch-plugin-1.8.0.jar=web
# 3. Add -javaagent:./extensions/plugins/sonarqube-community-branch-plugin-${version}.jar=ce to the sonar.ce.javaAdditionalOpts property in your Sonarqube installation's config/sonar.properties file, e.g. sonar.ce.javaAdditionalOpts=-javaagent:./extensions/plugins/sonarqube-community-branch-plugin-1.8.0.jar=ce
COPY --chown=sonarqube:sonarqube ./sonar.properties /opt/sonarqube/conf/sonar.properties

# 4. Start Sonarqube, and accept the warning about using third-party plugins

USER sonarqube

ENTRYPOINT ["./bin/run.sh"]
