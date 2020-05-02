#!/bin/bash


log_warning "Loading from custom code_generator";
filename="${schema_file##*/}";
extension="${filename##*.}";
if [[ "$extension" == "proto" ]]; then
    protoc "$schema_file" --"${lang}_out"="$codepath";
elif [[ "$extension" == "json" ]]; then
    quicktype "$schema_file" -o "$codepath/$filename.$lang"
else
    log "Unknown extension!";
    exit -1;
fi