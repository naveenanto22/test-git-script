#!/bin/bash

lang=$1
codePath=com/$lang
schemaFileName=$2
echo "$lang with $schemaFileName" & 
mkdir -p $codePath;
protoc $schemaFileName --${lang}_out=./$codePath;
git checkout -B code/$lang;
git ls-files | grep -v "^com/csharp" | xargs git rm -f --quiet --cached;
git add .;
git commit -m "first commit"

# git ls-files | grep -v "^$1"
