Here are the steps with commands:

Setup Jenkins on EC2
-

1. Create an AWS EC2 instance (Jenkins Master)

2. Add [inbound traffic rules](https://github.com/ritvikraj-cse/Projects/blob/Jenkins/Boardgamepipeline_s/PHASE-1/Screenshot%202024-03-13%20002123.png) to the security group:
    - Go to EC2 > Instances > Click on <Instance-ID> > Security > Security groups
    - Add rule: Type=All traffic, Protocol=All, Port Range=All, Source=Anywhere

3. SSH to the Jenkins server:
    ```ssh -i "your_key.pem" ubuntu@your_instance_public_dns```

4. Update package list:  ```sudo apt-get update```

5. Install [Java, Jenkins and Docker](https://github.com/ritvikraj-cse/Projects/blob/Jenkins/Boardgamepipeline_s/PHASE-1/Jenkins.md)
    
6. Configure Jenkins:
```bash
sudo systemctl start jenkins
sudo systemctl enable jenkins
```

7. Grant Jenkins user and Ubuntu user permission to Docker daemon:
```
sudo usermod -aG docker jenkins
sudo usermod -aG docker ubuntu
```

8. Restart Docker:
   ```sudo systemctl restart docker```

Configure Jenkins Job
-

1. Install Docker Pipeline plugin in Jenkins:
    - Go to Jenkins > Manage Jenkins > Manage Plugins > Available > Search for "Docker Pipeline" and install

2. Switch to Jenkins user:
   ```su - jenkins```

3. Create a new [Jenkinsfile](https://github.com/ritvikraj-cse/Projects/blob/Jenkins/Docker_as_agent/java-maven-sonar-argocd-helm-k8s/spring-boot-app/JenkinsFile) in the project's root directory
    
4. Create a new Jenkins job and Configure the job to use the Jenkinsfile
6. Save and run the Jenkins job

Verify
-

1. Verify the job was successful:
    - Check the job's console output for success message
2. Verify the job created a new Docker image:
    - Check Docker Hub or local Docker repository for new image