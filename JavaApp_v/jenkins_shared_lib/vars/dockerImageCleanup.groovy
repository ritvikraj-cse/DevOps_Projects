// def call(String project, String ImageTag, String hubUser) {
//     sh """
//      docker rmi ${hubUser}/${project}:${ImageTag} || echo 'Image with tag ${ImageTag} not found, skipping...'
//      docker rmi ${hubUser}/${project} || echo 'Image without tag not found, skipping...'
//      docker rmi ${hubUser}/${project}:latest || echo 'Latest image not found, skipping...'
//     """
// }


// def call(String imageName, String dockerHubUser, int maxImagesToKeep) {
//     def dockerHubPassword = credentials('docker-cred') // Jenkins credentials ID

//     sh '''#!/bin/bash
//         # Fetch all image tags for the repository
//         tags=$(curl -s -u ${dockerHubUser}:${dockerHubPassword} https://hub.docker.com/v2/repositories/${dockerHubUser}/${imageName}/tags/ | jq -r '.results[].name')

//         # Sort tags in reverse order and keep only those exceeding the limit
//         tagsToDelete=$(echo "$tags" | sort -r | awk "NR > ${maxImagesToKeep}")

//         # Delete old tags
//         for tag in $tagsToDelete; do
//             echo "Deleting tag: $tag"
//             curl -X DELETE -u ${dockerHubUser}:${dockerHubPassword} https://hub.docker.com/v2/repositories/${dockerHubUser}/${imageName}/tags/$tag/
//         done
//     '''
// }





def call(String aws_account_id, String region, String ecr_repoName){
    
    sh """
     docker rmi ${ecr_repoName}:latest ${aws_account_id}.dkr.ecr.${region}.amazonaws.com/${ecr_repoName}:latest
    """
}
