CICD Steps:-
-
# Setup Jenkins and Sonarqube Containers using [docker-compose.yml](https://github.com/ritvikraj-cse/Projects/blob/Jenkins/JavaApp_v/Setup-Infra/docker-compose.yml)

```bash
docker-compose -f /path/to/your/docker-compose.yml up -d
```
### Configure Sonarqube
```
username and password = admin
```

### Configure Jenkins
- Install plugins- Git, Pipeline, Pipeline: Stage View, Pipeline: Shared Groovy Libraries, SonarQube Scanner, Sonar Gerrit, SonarQube Generic Coverage, Sonar Quality Gates, Maven Integration, Config File Provider, Docker, Docker Pipeline, docker-build-step, Matrix Authorization Strategy

# Create Jenkins Shared Library & Configure it
[jenkins_shared_lib](https://github.com/ritvikraj-cse/Projects/tree/Jenkins/JavaApp_v/jenkins_shared_lib) and then Push the Application Code to Git.

Dashboard -> Manage Jenkins -> System -> Global Pipeline Libraries
```
Name = my-shared-library
Default version = Jenkins
Retrieval method = Modern SCM
Project Repository = https://github.com/ritvikraj-cse/Projects.git
Library Path = JavaApp_v/jenkins_shared_lib/
```
Apply and Save. 

# Write [Jenkinsfile](https://github.com/ritvikraj-cse/Projects/blob/Jenkins/JavaApp_v/Jenkinsfile) and Configure jenkins for each stage as below:-

### 1. Git checkout
Dashboard -> JavaApp_v -> Configuration -> Pipeline
```
Definition = Pipeline script from SCM
SCM = git
Repository URL = https://github.com/ritvikraj-cse/Projects.git
Branches to build = */Jenkins
Script Path = JavaApp_v/Jenkinsfile 
```

### 2. Unit Test: maven [ OR, Install [Maven](https://github.com/ritvikraj-cse/Installation_scripts/blob/master/Maven.sh) on Jenkins Server]
- Dashboard -> Manage Jenkins -> Tools -> Maven installations
```
Name = maven3
Version = 3.6.1
```
- Dashboard -> Manage Jenkins -> Tools -> JDK installations
```
Name = jdk11
Add installer = Install from adoptium.net
Version = 11.0.22
```

### 3. Integration Test: maven 

### 4. Static code analysis: Sonarqube
- Sonarqube -> Administration -> Security -> Users -> Update token -> Generate -> Copy the token.
- Jenkins -> Manage Jenkins -> Credentials -> System -> Global credentials (unrestricted) -> Create new credential with Kind "Secret text" -> Paste the token and ID (ex:- sonar-cred).
- Jenkins -> Manage Jenkins -> System -> SonarQube servers -> Tick "Environment variables" -> SonarQube installations
```bash
Name = sonar-api
Server URL = http://sonarqube:9000  # To access on Jenkins Container
Server authentication token = sonar-cred
```
### 5. Quality Gate Status Check: Sonarqube
- Sonarqube -> Administration -> Configuration -> webhooks -> Create
```
Name = anything
URL = http://jenkins:8080/sonarqube-webhook
```
### 6. Build: maven

### 7. Build Image: Docker [Install [Docker](https://github.com/ritvikraj-cse/Installation_scripts/blob/master/docker.sh) on Jenkins Server]
```
docker exec -u 0 -it jenkins /bin/bash
apt-get install sudo
```
- Install Docker
```
sudo chmod 666 /var/run/docker.sock
```
- Create [Dockerfile](https://github.com/ritvikraj-cse/Projects/blob/Jenkins/JavaApp_v/Dockerfile) and Push to GitHub.

### 8. Docker Image Scan: Trivy [Install [Trivy](https://github.com/ritvikraj-cse/Installation_scripts/blob/master/trivy.sh) on Jenkins Server]

### 9. Docker Image Push : DockerHub
- Jenkins -> Manage Jenkins -> Credentials -> System -> Global credentials (unrestricted) -> Username and Password of DockerHub and ID like docker-cred.
- Verify the image on DockerHub.

### 10.Docker Image Cleanup : DockerHub










