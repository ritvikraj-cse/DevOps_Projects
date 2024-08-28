Git & GitHub
-

1. Create a Private Git Repository
    - Go to your preferred Git hosting platform (e.g., GitHub, GitLab, Bitbucket) and create a new repository, setting it as private.

2. Generate a Personal Access Token
    - Navigate to your account settings or profile settings.
    - Look for the "Developer settings" or "Personal access tokens" section.
    - Generate a new token, providing it with the necessary permissions (e.g., repo access).

3. Clone the Repository Locally: 
   ```git clone <repository_URL```

4. Add Your Source Code Files
    - Navigate into the cloned repository directory.
    - Paste your source code files or create new ones inside this directory.

5. Stage: ```git add .``` and Commit Changes: ```git commit -m "Your commit message here"```


6. Push Changes to the Repository: 
    ```git push```
    - If it's your first time pushing to this repository, you might need to specify the remote and branch: ```git push -u origin master```

7. Enter Personal Access Token as Authentication
    - When prompted for credentials during the push, enter your username (usually your email) and use your personal access token as the password.