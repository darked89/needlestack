#!/bin/bash
cd ~/project/NGS_data_test
rm -rf 1000G_CEU_TP53/.nextflow
git config --global user.email "follm@iarc.fr"
git config --global user.name "Circle CI_$CIRCLE_PROJECT_REPONAME_$CIRCLE_BRANCH"
git add .
git status
git commit --allow-empty -m "Results from $CIRCLE_PROJECT_REPONAME:$CIRCLE_BRANCH CircleCI tests build $CIRCLE_BUILD_NUM [skip ci]"
git push origin master

curl -H "Content-Type: application/json" --data "{\"source_type\": \"Branch\", \"source_name\": \"$CIRCLE_BRANCH\"}" -X POST https://cloud.docker.com/api/build/v1/source/1ec66180-4c92-4d37-9324-dc422846fff0/trigger/fcd71f24-0f1e-40b8-b76a-09eb5a39e924/call/
