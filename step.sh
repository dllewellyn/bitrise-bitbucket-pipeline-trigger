#!/bin/bash
set -ex

curl https://api.bitbucket.org/2.0/repositories/xdesign365/marvin-android/pipelines/  -u ${bitbucket_username}:${bitbucket_app_password}  -H "content-type: application/json" -d '{"target": { "ref_type": "branch",  "type": "pipeline_ref_target", "ref_name": "${branch}", "selector": { "type":"custom", "pattern":"deployed" } }}' -X POST


#
# --- Export Environment Variables for other Steps:
# You can export Environment Variables for other Steps with
#  envman, which is automatically installed by `bitrise setup`.
envman add --key EXAMPLE_STEP_OUTPUT --value 'the value you want to share'
# A very simple example:
# Envman can handle piped inputs, which is useful if the text you want to
# share is complex and you don't want to deal with proper bash escaping:
#  cat file_with_complex_input | envman add --KEY EXAMPLE_STEP_OUTPUT
# You can find more usage examples on envman's GitHub page
#  at: https://github.com/bitrise-io/envman

#
# --- Exit codes:
# The exit code of your Step is very important. If you return
#  with a 0 exit code `bitrise` will register your Step as "successful".
# Any non zero exit code will be registered as "failed" by `bitrise`.
