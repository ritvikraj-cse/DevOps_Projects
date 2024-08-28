# Creating an EC2 instance and then installing Jenkins and SonarQube:

## Step 1: Create an EC2 Instance
- [AWS Management Console](https://aws.amazon.com/console/) -> EC2 dashboard -> "Launch Instance" 
- Choose an AMI, instance type, key pair, and configure instance details (e.g., VPC, subnet, security group)
-> Launch the instance



## Step 2: Connect to the EC2 Instance
```bash
ssh -i "path/to/your/key.pem" ec2-user@ec2-instance-public-ip
```


## Step 3: Install [Java, Jenkins, and Docker](https://github.com/ritvikraj-cse/Projects/blob/Jenkins/Boardgamepipeline_s/PHASE-1/Jenkins.md)


## Step 4: Configure [Inbound Traffic Rules](https://github.com/ritvikraj-cse/Projects/blob/Jenkins/Boardgamepipeline_s/PHASE-1/Screenshot%202024-03-13%20002123.png)


## Step 5: Login to Jenkins

- Access Jenkins via: ```http://<ec2-instance-public-ip>:8080```
- Copy and enter the administrator password: ```sudo cat /var/lib/jenkins/secrets/initialAdminPassword```
- Install [Plugins](https://github.com/ritvikraj-cse/Projects/blob/Jenkins/Boardgamepipeline_s/PHASE-3/CICD.md) and Configure Jenkins






## Step 6: Run SonarQube as Docker Container

- Run SonarQube container: ```sudo docker run -d --name sonar -p 9000:9000 sonarqube:lts-community```
- Access Jenkins via: ```http://<ec2-instance-public-ip>:9000```


## Step 7: Configure SonarQube Server in Jenkins

- Manage Jenkins -> Configure System -> SonarQube servers -> Add a new SonarQube server
- Set the server URL to ```http://localhost:9000```
- Set the credentials to admin/admin (default)

That's it! You now have an EC2 instance running Jenkins and SonarQube.



# Docker Slave Configuration

- Install [Docker](https://github.com/ritvikraj-cse/Projects/blob/Jenkins/Boardgamepipeline_s/PHASE-1/Jenkins.md)

- Grant Jenkins and Ubuntu users permission to the Docker daemon:
```bash
sudo su -
usermod -aG docker jenkins
usermod -aG docker ubuntu
```

- Restart Docker: ```systemctl restart docker```

- Restart Jenkins:
    ```http://<ec2-instance-public-ip>:8080/restart```

The Docker agent configuration is now successful.

