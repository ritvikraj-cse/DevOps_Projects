# Mail Notification

## Gmail
- Gmail -> Setting -> Security -> 2-Step Verification -> Generate App password.

## Jenkins
- Manage Jenkins -> System -> Extended Email Notification
    - SMTP server = smtp.gmail.com
    - SMTP port = 465
    - Use SSL = true
    - SMTP username = your email
    - SMTP password = your app password
    - ID = mail-cred

- Manage Jenkins -> System -> Email Notification
    - SMTP server = smtp.gmail.com 
    - Use SSL = true
    - SMTP port = 465
    - Use SMTP Authentication
        - SMTP username = your email
        - SMTP password = your app password
    - Test configuration by sending test e-mail
        - Test e-mail recipient = your email

- Apply and Save

```bash
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
```



     
 

