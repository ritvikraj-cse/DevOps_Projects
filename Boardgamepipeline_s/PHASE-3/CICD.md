## Install Plugins in Jenkins

1. Eclipse Temurin Installer
2. Pipeline Maven Integration
3. Config File Provider
4. SonarQube Scanner
5. Kubernetes CLI
6. Kubernetes
7. Docker
8. Docker Pipeline Step

## Pipeline 

```groovy

pipeline {
    agent any
    
    tools {
        jdk 'jdk17'
        maven 'maven3'
    }

    environment {
        SCANNER_HOME = tool 'sonar-scanner'
    }

    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'Jenkins', credentialsId: 'git-cred', url: 'https://github.com/ritvikraj-cse/Projects.git'
                
            }
        }
        
        stage('Compile') {
            steps {
                dir('Boardgamepipeline_s/Boardgame-main') {
                    sh "mvn compile"
                }
            }
        }
        
        stage('Test') {
            steps {
                dir('Boardgamepipeline_s/Boardgame-main') {
                    sh "mvn test"
                }
            }
        }
        
        stage('File System Scan') {
            steps {
                dir('Boardgamepipeline_s/Boardgame-main') {
                    sh "trivy fs --format table -o trivy-fs-report.html ."
                }
            }
        }
        
        stage('SonarQube Analysis') {
            steps {
                dir('Boardgamepipeline_s/Boardgame-main') {
                    withSonarQubeEnv('sonar') {
                        sh ''' $SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=BoardGame -Dsonar.projectKey=BoardGame \
                                -Dsonar.java.binaries=. '''
                    }
                }
            }
        }
        
        stage('Quality Gate') {
            steps {
                dir('Boardgamepipeline_s/Boardgame-main') {
                    script {
                        waitForQualityGate abortPipeline: false, credentialsId: 'sonar-token' 
                    }
                }
            }
        }
        
        stage('Build') {
            steps {
                dir('Boardgamepipeline_s/Boardgame-main') {
                    sh "mvn package"
                }
            }
        }
        
        stage('Publish To Nexus') {
            steps {
                dir('Boardgamepipeline_s/Boardgame-main') {
                    withMaven(globalMavenSettingsConfig: 'global-settings', jdk: 'jdk17', maven: 'maven3', mavenSettingsConfig: '', traceability: true) {
                        sh "mvn deploy"
                    }
                }
            }
        }
        
        stage('Build & Tag Docker Image') {
            steps {
                dir('Boardgamepipeline_s/Boardgame-main') {
                    script {
                        withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                        //Build a Docker image from the current directory's Dockerfile and tag it as "boardgame:latest"
                            sh "docker build -t boardgame:latest ."

                        //Tag the "boardgame:latest" image with a new name and repository, preparing it for pushing to Docker Hub
                            sh "docker tag boardgame:latest ritvikraj/boardgame:latest"
                        }
                    }
                }
            }
        }
        
        stage('Docker Image Scan') {
            steps {
                dir('Boardgamepipeline_s/Boardgame-main') {
                    sh "trivy image --format table -o trivy-image-report.html ritvikraj/boardgame:latest"
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                dir('Boardgamepipeline_s/Boardgame-main') {
                    script {
                        withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                            sh "docker push ritvikraj/boardgame:latest"
                        }
                    }
                }
            }
        }
        
        stage('Deploy To Kubernetes') {
            steps {
                dir('Boardgamepipeline_s/Boardgame-main') {
                    withKubeConfig(caCertificate: '', clusterName: 'kubernetes', contextName: '', credentialsId: 'k8-cred', namespace: 'webapps', restrictKubeConfigAccess: false, serverUrl: 'https://172.31.8.146:6443') {
                        sh "kubectl apply -f deployment-service.yaml"
                    }
                }
            }
        }
        
        stage('Verify the Deployment') {
            steps {
                dir('Boardgamepipeline_s/Boardgame-main') {
                    withKubeConfig(caCertificate: '', clusterName: 'kubernetes', contextName: '', credentialsId: 'k8-cred', namespace: 'webapps', restrictKubeConfigAccess: false, serverUrl: 'https://172.31.8.146:6443') {
                        sh "kubectl get pods -n webapps"
                        sh "kubectl get svc -n webapps"
                    }
                }
            }
        }
    }

    post {
        always {
            script {
                def jobName = env.JOB_NAME
                def buildNumber = env.BUILD_NUMBER
                def pipelineStatus = currentBuild.result ?: 'UNKNOWN'
                def bannerColor = pipelineStatus.toUpperCase() == 'SUCCESS' ? 'green' : 'red'

                def body = """
                    <html>
                    <body>
                    <div style="border: 4px solid ${bannerColor}; padding: 10px;">
                    <h2>${jobName} - Build ${buildNumber}</h2>
                    <div style="background-color: ${bannerColor}; padding: 10px;">
                    <h3 style="color: white;">Pipeline Status: ${pipelineStatus.toUpperCase()}</h3>
                    </div>
                    <p>Check the <a href="${BUILD_URL}">console output</a>.</p>
                    </div>
                    </body>
                    </html>
                """

                emailext (
                    subject: "${jobName} - Build ${buildNumber} - ${pipelineStatus.toUpperCase()}",
                    body: body,
                    to: 'ritvikraj.cse@gmail.com',
                    from: 'jenkins@example.com',
                    replyTo: 'jenkins@example.com',
                    mimeType: 'text/html',
                    attachmentsPattern: 'trivy-image-report.html'
                )
            }
        }
    }
}
```
