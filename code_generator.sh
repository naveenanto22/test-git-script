#!/bin/bash


log_warning "Loading from custom code_generator";
protoc "$schema_file" --"${lang}_out"="$codepath";