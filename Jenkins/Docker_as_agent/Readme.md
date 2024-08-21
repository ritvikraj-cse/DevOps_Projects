1. Create AWS EC2 Instance (Jenkins - Master)

2. EC2 > Instances > Click on <Instance-ID> > Security > Security groups
- Add inbound traffic rules as shown in the image (you can just allow TCP 8080 as well, in my case, I allowed `All traffic`).

<img width="1187" alt="Screenshot 2023-02-01 at 12 42 01 PM" src="https://user-images.githubusercontent.com/43399466/215975712-2fc569cb-9d76-49b4-9345-d8b62187aa22.png">

3. ssh to the Jenkins server

4. sudo apt-get update

5. Install Java

6. Install Jenkins

7. Configure Jenkins

8. Install Docker

9. Grant Jenkins user and Ubuntu user permission to docker daemon

10. Restart Docker

11. Install the Docker Pipeline plugin under manage plugins in jenkins.

12. su - jenkins

13. Create a new Jenkinsfile in the root directory of your project

14. Create a new Jenkins job

15. Configure the Jenkins job to use the Jenkinsfile

16. Save and run the Jenkins job

17. Verify the job was successful

18. Verify the job created a new Docker image