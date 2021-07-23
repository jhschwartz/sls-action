#!/bin/bash
# shellcheck disable=SC2068
# Using this script because github action passess the arguments as strings
# instead of array
echo ">>> Running sls $*"'
cd api
/app/node_modules/.bin/sls $@ | tee deploy.log
egrep "ANY -.*/$" deploy.log | awk '{gsub("  ANY - ", "");print}' > .api_url
echo "saved api url to file .api_url"
echo ">>> Completed"
