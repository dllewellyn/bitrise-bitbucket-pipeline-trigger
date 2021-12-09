#!/bin/bash
set -ex

curl https://api.bitbucket.org/2.0/repositories/${bitbucket_workspace}/${bitbucket_slug}/pipelines/  -u ${bitbucket_username}:${bitbucket_app_password}  -H "content-type: application/json" -d '{"target": { "ref_type": "branch",  "type": "pipeline_ref_target", "ref_name": ${branch}" "selector": { "type":"custom", "pattern":${pipeline_to_trigger} } }}' -X POST
