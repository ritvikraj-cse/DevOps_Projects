Phase-1 (Setup Infrastructure)

1. Create IAM user and access key
2. Set up default VPC and Add inbounds in security group
3. EC2 Instances
- Launch 7 EC2 instances:
  - **Master**: For environment management.
  - **2 Slaves**: For builds and deployments.
  - **Sonarqube**: For code analysis.
  - **Nexus**: For artifact management.
  - **Jenkins**: For CI/CD.
  - **Monitor**: For monitoring and logging.
4. Create key pair and SSH to Master and Slave servers 
5. Run setup commands on respective server for:
    - Kubernetes
    - Nexus
    - Sonarqube
    - Jenkins
6. Configure Nexus, Sonarqube, and Jenkins in browser