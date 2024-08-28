Phase-1: Setup Infrastructure
-

1. Create IAM user and access key
2. Set up default VPC and [security group](https://github.com/ritvikraj-cse/Projects/blob/Jenkins/Boardgamepipeline_s/PHASE-1/Screenshot%202024-03-13%20002123.png)

3. [EC2 Instances](https://github.com/ritvikraj-cse/Projects/blob/Jenkins/Boardgamepipeline_s/PHASE-1/Create_VM.md) - Launch 7 EC2 instances
   - **Master**: For environment management.
   - **2 Slaves**: For builds and deployments.
   - **Sonarqube**: For code analysis.
   - **Nexus**: For artifact management.
   - **Jenkins**: For CI/CD.
   - **Monitor**: For monitoring and logging.

4. Create key pair and SSH to Master and Slave servers
```bash
ssh -i "path/to/your/key.pem" ec2-user@ec2-instance-public-ip
```

5. Run setup commands on respective servers ([Kubernetes](https://github.com/ritvikraj-cse/Projects/blob/Jenkins/Boardgamepipeline_s/PHASE-1/K8-Setup.md), [Nexus](https://github.com/ritvikraj-cse/Projects/blob/Jenkins/Boardgamepipeline_s/PHASE-1/Nexus.md), [Sonarqube](https://github.com/ritvikraj-cse/Projects/blob/Jenkins/Boardgamepipeline_s/PHASE-1/Sonarqube.md), [Jenkins](https://github.com/ritvikraj-cse/Projects/blob/Jenkins/Boardgamepipeline_s/PHASE-1/Jenkins.md))

6. Configure Nexus, Sonarqube, and Jenkins in browser
