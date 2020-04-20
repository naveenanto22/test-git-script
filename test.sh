#!/bin/bash

##############################
######## Helper block ########
##############################


# Initialize colors
RED='\033[0;31m';
DARK_GREY='\033[1;30m';
GREEN='\033[0;32m';
LIGHT_GREY='\033[0;37m';
YELLOW='\033[1;33m';
NC='\033[0m';

log_info () {
    echo "${LIGHT_GREY}$1${NC}";
}

log_debug () {
    echo "${DARK_GREY}$1${NC}";
}

log_success() {
    echo "${GREEN}$1${NC}";
}

log_warning () {
    echo "${YELLOW}$1${NC}";
}

log_error () {
    echo "${RED}$1${NC}";
}

###############################
####### Main Code block #######
###############################

source ./input_parser.sh;

log_debug "Lang = $languages | Generator = $generator | Schema Files = $schema_files_unseperated | Code Path = $codepath | Commit Msg = $commit_msg";

source_branch=$(git rev-parse --abbrev-ref HEAD);

log_debug "Source branch : $source_branch";

for (( idx=${#languages[@]}-1 ; idx>=0 ; idx-- )) ; do
    lang=${languages[idx]}

    mkdir -p "$codepath";

    for schema_file in ${schema_files[@]}; do
        protoc "$schema_file" --"${lang}_out"=./"$codepath";
    done

    git stash -u -m ${lang};

done

for lang in ${languages[@]}; do

    current_branch_prefix="$branch_prefix/$lang";

    current_branch="$branch_prefix/$lang";

    if [[ ! $(git checkout -b "$current_branch" origin/"$current_branch") ]]; then
        if [[ ! $(git checkout -b "$current_branch") ]]; then
            git checkout "$current_branch";
            
            # Might not be needed in our case
            # git pull origin "$current_branch";
        fi
    fi


    git_files=$(git ls-files);

    echo "$git_files" | xargs rm -rfd;
    echo "$git_files" | xargs git rm -f --quiet --cached;

    git ls-files -o | xargs rm -rfd;

    git stash pop;

    git add .;
    git status;
    git commit -m "$commit_msg";
    git push -f origin "$current_branch";

done

git checkout $source_branch;
