Phase-3: CICD with Jenkins
-

1. Install and configure [Jenkins plugins](https://github.com/ritvikraj-cse/Projects/blob/Jenkins/Boardgamepipeline_s/PHASE-3/CICD.md)

2. Create a new pipeline with stages: ```Git Checkout, Compile, Test, File System Scan, Trivy, Sonarqube Analysis, Quality Gate, Build, Publish to Nexus, Docker Build & Tag, Docker Image Scan, Trivy, Docker Push, Deploy to Kubernetes, Verify deployment```

3. Add credentials for Github, Sonarqube, Docker, and Kubernetes

4. Configure Sonarqube server and Create Webhook for Quality Gate
    ```
    <http://jenkins-public-ip:8080>sonarqube-webhook/
    ```
5. Update pom.xml for Nexus publishing
   - Maven releases repo URL from Nexus
    - Maven snapshots repo URL from Nexus
6. Add Nexus credentials
   
    - Manage Jenkins -> Managed files -> Add a new config
9. Write [deployment-service.yaml](https://github.com/ritvikraj-cse/Projects/blob/Jenkins/Boardgamepipeline_s/Boardgame-main/deployment-service.yaml)

10. Deploy to Kubernetes and verify
11. Set up [mail notification](https://github.com/ritvikraj-cse/Projects/blob/Jenkins/Boardgamepipeline_s/PHASE-3/Mail_Notificaiton.md)
12. Build the pipeline