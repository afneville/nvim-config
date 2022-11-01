#!/bin/sh

SCHEME_REPO_NAME="base16-schemes"
SCHEME_REPO_HTTPS="https://github.com/tinted-theming/base16-schemes.git"
WORKING_DIR="$(dirname $(realpath $0))"
LOCAL_REPO="${WORKING_DIR}/${SCHEME_REPO_NAME}"

get_schemes() {
    echo $LOCAL_REPO
    if [ ! -d "$LOCAL_REPO" ]; then
        git clone $SCHEME_REPO_HTTPS & 
    else
        git --git-dir=${LOCAL_REPO}/.git pull &
    fi
    echo "Fetching latest colour schemes ..."
    wait
    echo "Done."
}



main() {
   get_schemes
}

main
