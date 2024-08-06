# Script to Report AWS Resource Usage (EC2, S3, IAM etc) to your manager in your Project

#!/bin/bash

set -x

# List S3 buckets
echo "S3 buckets are---"
aws s3 ls > resourceTracker

# List EC2 instances
echo "EC2 instances are---"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'

# List IAM users
echo "IAM users are---"
aws iam list-users >> resourceTracker

:q!



#jq is used for JSON parser. yq is for yaml parser.
chmod 777 aws_res_tracker.sh
Running the Script
./aws_res_tracker.sh | more    # more- To view it page by page instead, less- scrolling

