#!/usr/bin/env bash

# This script pushes the autobackup image to the repository and runs the task

set -e

REPOSITORY=482995409068.dkr.ecr.ap-southeast-1.amazonaws.com
STAGING_CLUSTER=MobiFone-Vietnam-staging
PRODUCTION_CLUSTER=MobiFone-Vietnam-production
PRIVATE_SUBNET_ONE=subnet-06dae9fbac9f27aa0
PRIVATE_SUBNET_TWO=subnet-09cac75bd2492f8c7
SECURITY_GROUP=sg-067adc6433b98eabe
PROFILE=mobifone

USAGE="Usage: run_introspection"
CLUSTER=$STAGING_CLUSTER

IMAGE="$REPOSITORY/introspection:latest"
echo "Creating image $IMAGE"
docker image build -t $IMAGE .

AWS_PROFILE=$PROFILE docker push $IMAGE
aws ecs run-task --cluster $CLUSTER --task-definition introspection --network-configuration "awsvpcConfiguration={subnets=[$PRIVATE_SUBNET_ONE, $PRIVATE_SUBNET_TWO],securityGroups=[$SECURITY_GROUP],assignPublicIp=DISABLED}" --launch-type "EC2" --count 1 --profile $PROFILE
