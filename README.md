

## Things that trip me up about coffeescript
  * Indentation rules

# AWS
## Running Hubot from Docker in ECS
   * Follow this tutorial: http://garbe.io/blog/2015/03/24/how-to-run-hubot-in-docker-on-aws-ec2-container-services-part-1/

## Logging to Cloud Watch
   ~~~~
   aws logs create-log-group --log-group-name awslogs-peden-hubot --region us-west-2k
   ~~~~
## Storing secrets in S3
  * Move environment vars to env.sh, and upload this file to an S3 bucket
  * Add a policy to the IAM role used by the Container Instances in your ECS cluster to provide access to the file in S3 :
  ~~~~
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": [
          "s3:GetObject"
        ],
      "Sid": "Stmt0123456789",
      "Resource": [
        "arn:aws:s3:::your_s3_bucket/env.sh"
      ],
      "Effect": "Allow"
      }
    ]
  }
  ~~~~
  * Install the awscli in your Dockerfile:
  ~~~~
  RUN apt-get update && \
      apt-get install -y python-pip && \
      pip install awscli
  ~~~~
  * Download and run the env.sh from S3 before launching hubot:
  ~~~~
  CMD ["/bin/sh", "-c", "aws s3 cp --region us-west-2 s3://peden-hubot-secrets/env.sh .; . ./env.sh; bin/hubot --adapter slack"]
  ~~~~
