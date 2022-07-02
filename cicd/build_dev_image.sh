#!/bin/bash
# Bash script to create docker development image
# PARAM is the type of version update, ie: hotfix, minor, major.

PARAM=$1

CURRENT_VERSION=$(docker images | awk 'FNR == 2 {print}'|  awk '{print $2}')


if [[ ${PARAM} == 'minor' ]];
then 
    NEW_VERSION = 









docker build -f docker/Dockerfile.dev -t devimage: