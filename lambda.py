import json

def lambda_handler(event, context):
    if event["source"] != "aws.ecs":
       raise ValueError("Function only supports input from events with a source type of: aws.ecs")
       
    print('clusterArn: ' + event["detail"]["clusterArn"])
    print('taskArn: ' + event["detail"]["taskArn"])
    print('group: ' + event["detail"]["group"])
    print('desiredStatus: ' + event["detail"]["desiredStatus"])
    print('lastStatus: ' + event["detail"]["lastStatus"])