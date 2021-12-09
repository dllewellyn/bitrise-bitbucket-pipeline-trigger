#!/bin/bash
set -ex

echo $bitbucket_repo
echo $branch 
echo $bitbucket_slug
echo $bitbucket_workspace
echo $pipeline_to_trigger

curl https://api.bitbucket.org/2.0/repositories/xdesign365/marvin-android/pipelines/  -u ${bitbucket_username}:${bitbucket_app_password}  -H "content-type: application/json" -d '{"target": { "ref_type": "branch",  "type": "pipeline_ref_target", "ref_name": "${branch}", "selector": { "type":"custom", "pattern":"${pipeline_to_trigger}" } }}' -X POST
