#!/usr/bin/env bash

set -e

PROFILE=mobifone

aws ecs register-task-definition --cli-input-json file://intro-task.json --profile $PROFILE
