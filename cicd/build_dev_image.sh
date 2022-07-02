#!/bin/bash
# Bash script to create docker development image
# PARAM is the type of version update, ie: hotfix, minor, major.
# Run script from parent directory.

PARAM=$1

CURRENT_VERSION=$(docker images | awk 'FNR == 2 {print}'|  awk '{print $2}')

if [[ ${PARAM} == 'minor' ]];
then 
    NEW_VERSION=$(docker images | grep 'devimage' | awk '{print $2}' |  awk -vFS=. -vOFS=. '{$NF++;print}')
elif [[ ${PARAM} == 'major' ]];
then
    NEW_VERSION=$(docker images | grep 'devimage' | awk '{print $2}' |  awk -vOFS=. '{$NF++;print}')
else
    echo "ARGUMENT PARSING ERROR: Patch type: Major or Minor."
    exit
fi

echo "Building new docker image with tag version: ${NEW_VERSION}"
docker build -f docker/Dockerfile.dev -t $NEW_VERSION .