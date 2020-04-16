#!/bin/bash

lang=$1
codePath=com/$lang
schemaFileName=$2
echo "$lang with $schemaFileName" & 
mkdir -p $codePath;
protoc $schemaFileName --${lang}_out=./$codePath;
git checkout -B code/$lang;
git ls-files | grep -v "^$codePath" | xargs git rm -f --quiet --cached;
git ls-files | grep -v "^$codePath" | xargs rm -rf
git add .;
git commit -m "first commit"

# git ls-files | grep -v "^$1"
