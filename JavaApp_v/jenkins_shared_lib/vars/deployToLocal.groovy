def call(String imageName, String imageTag) {
    // Deploy Docker image to local environment
    sh """
    docker run -d -p 3000:3000 --name ${imageName} ${imageName}:${imageTag}
    """
}