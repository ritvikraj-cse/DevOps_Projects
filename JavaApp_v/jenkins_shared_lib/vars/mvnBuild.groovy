def call(){
    sh 'mvn clean install'
}



// 1. mvn clean - Delete target directory
// 2. mvn clean package - Clean and package
// 3. mvn clean install - Clean, package, and install
// 4. mvn package - Package only
// 5. mvn install - Install only
// 6. mvn deploy - Deploy to remote repository
// 7. mvn test - Run unit tests
// 8. mvn verify - Run integration tests
// 9. mvn site - Generate site documentation
// 10. mvn validate - Validate project structure
// 11. mvn compile - Compile source code
// 12. mvn build - Build project (compile, package, install)