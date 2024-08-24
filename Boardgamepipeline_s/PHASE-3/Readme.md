Phase-3 (Jenkins)

1. Install required plugins from "cicd.md" file
2. Configure Jenkins plugins:
    - JDK17 
    - Sonarqube 5.0.1.3006
    - Maven 3.6.1
    - Docker
3. Create new pipeline
4. Write jenkins pipeline script
    - Git Checkout
    - Compile
    - Test
    - File System Scan - Trivy
    - Sonarqube Analysis
    - Quality Gate
    - Build
    - Publish to Nexus
    - Docker Build & Tag
    - Docker Image Scan - Trivy
    - Docker Push
    - Deploy to Kubernetes
    - Verify the deployment
5. Add credentials:
    - Github
    - Sonarqube server
    - Docker
    - K8
6. Configure Sonarqube server under Manage Jenkins
    - Create Webhook for Quality Gate
    ```
    <http://jenkins-public-ip:8080>sonarqube-webhook/
    ```
7. To publish to Nexus, Update pom.xml with:
    - Maven releases repo URL from Nexus
    - Maven snapshots repo URL from Nexus
8. Add Nexus credentials
    - Manage Jenkins -> Managed files -> Add a new config
9. Write Boardgamepipeline_s/Boardgame-main/deployment-service.yaml
10. Deploy to Kubernetes and Verify the deployment
12. Setup mail notifications
13. Build the Pipeline