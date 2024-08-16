# Phase-1

- IAM user
- Access key
- Default VPC
- Add inbounds in SG
- 7 EC2 - 1 master 2 slave 1 sonarqube 1 nexus 1 Jenkins 1 monitor
- Key-pair
- Ssh to all servers 
- Install K8-Setup commands
- Install Nexus commands on Nexus server 
- Install Sonarqube commands on Sonarqube server
- Install Jenkins commands on Jenkins Server
- Open Nexus Repo, Sonarqube, Jenkins and configure on the browser.

# Phase-2

- Create project repo and push all the project source code to the Github.

# Phase-3

- Install required plugins from cicd.md file
- Configure all the jenkins plugins like jdk, sonarqube, maven, docker
- Create a new pipeline
- Write pipeline script
- Add required credentials for github, sonarqube server under manage jenkins
- Configure sonarqube server under system under manage jenkins
- Add maven releases repo url from nexus repo to pom.xml of boardgame project.
- Add maven snapshots repo url from  nexus repo to pom.xml of boardgame project.
- Add nexus credentials.

#Deploy to K8s now-- on Master

- Create a namespace
- Create a Service Account 
- Create Role
- Bind the role to service account
- Generate token using service account in the namespace


- Add k8s credentials to the Jenkins
- Add script in jenkins
- Create manifest file ie. deployment-service file inside the boardgame project.
- Install kubectl on Jenkins

- Now configure mail notification on gmail
- Configure email notifiaciton under system under manage jenkins on Jenkins 
- Write script for mail notification.

- Now build now the jenkins pipeline.


# Phase- 4

- Install prometheus on Monitor VM
- Install grafana on Monitor VM
- Open prometheus and Grafana in browser
- Install blackbox exporter
- Edit prometheus.yaml file
- Install prometheus plugin in jenkins 


