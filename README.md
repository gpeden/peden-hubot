

## Things that trip me up about coffeescript
  * Indentation rules

# AWS
## Running Hubot from Docker in ECS
   * Follow this tutorial: http://garbe.io/blog/2015/03/24/how-to-run-hubot-in-docker-on-aws-ec2-container-services-part-1/

## Logging to Cloud Watch
   aws logs create-log-group --log-group-name awslogs-peden-hubot --region us-west-2k

## Storing secrets in S3
  * Create role to allow access to your env.sh in S3 from your instance
