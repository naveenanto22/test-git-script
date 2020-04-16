#!/bin/bash

lang=$1
codePath=com/$lang
schemaFileName=$2
echo $lang
mkdir -p $codePath
protoc $schemaFileName --$lang_out=./$codePath
git checkout -b code/$lang || git checkout code/$lang
git ls-files | grep -v "^$codePath" | xargs git rm --quiet --cached
git add .
git commit -m "first commit"

# git ls-files | grep -v "^$1"
