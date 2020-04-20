# set -e
# Loop through each argument and assign
previous_arg="";

while [ $# -gt 0 ]; do

    if [[ $1 == *"--"* ]]; then
        previous_arg=${1%=*}
    fi

    case "$1" in
        # 1. Get language to generate code
        --lang=*)
            lang="${1#*=}"
            ;;
        --lang)
            lang="${2}"
            shift
            ;;

        # 2. Get generator (proto, avro, json etc...)
        --generator=*)
            generator="${1#*=}"
            ;;
        --generator)
            generator="${2}"
            shift
            ;;

        # 3. Get schema files separated by comma
        --schema_files=*)
            schema_files_unseperated="${1#*=}";
            ;;
        --schema_files)
            schema_files_unseperated="${2}"
            shift
            ;;

        # 4. Get directories to place the generated code
        --codepath=*)
            codepath="${1#*=}"
            ;;
        --codepath)
            codepath="${2}"
            shift
            ;;

        # 5. Get Commit Msg for Code Generation
        --commit_msg=*)
            commit_msg="${1#*=}"
            ;;
        --commit_msg)
            commit_msg="${2}"
            shift
            ;;

        # 6. Get version number of the schema
        --version=*)
            version="${1#*=}"
            ;;
        --version)
            version="${2}"
            shift
            ;;

        # 7. Get branch prefix. The generated code will be placed in branch: {branch_prefix}/{lang}
        --branch_prefix=*)
            branch_prefix="${1#*=}"
            ;;
        --branch_prefix)
            branch_prefix="${2}"
            shift
            ;;
        
        *)
            if [[ $previous_arg == "--schema_files" ]]; then
                schema_files_unseperated="$schema_files_unseperated,$1"
            else
                log_error "Unknown input: $1. $previous_arg doesn't accept multiple params!"
                exit 1
            fi
            ;;
    esac
    shift
done

# Default language as `java`
lang=${lang:-"java"}

# Default generator as `proto`
generator=${generator:-"proto"}

# Default schema file as `schema.{generator}`
schema_files_unseperated=${schema_files_unseperated:-"schema.$generator"}
schema_files=("${schema_files_unseperated//,/ }");

# Default code path as `schema/`
codepath=${codepath:-"schema"}

# Get the latest commit message from current workspace
latest_commit=$(git log --oneline | head -n 1);
latest_commit_sha=${latest_commit:0:6};

# Defaults to "Code generated for the {latest_commit_sha}"
commit_msg=${commit_msg:-"Code generated for $latest_commit_sha"};

# Default version as `latest`
version=${version:-"latest"}

# Default branch_prefix as `code`
branch_prefix=${branch_prefix:-"code"}