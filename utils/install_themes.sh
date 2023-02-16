#!/usr/bin/env bash

SCHEME_REPO_NAME="b16-themes"
SCHEME_REPO_HTTPS="https://github.com/alexanderneville/${SCHEME_REPO_NAME}.git"
WORKING_DIR="$(dirname $(realpath $0))"
LOCAL_REPO="${WORKING_DIR}/${SCHEME_REPO_NAME}"
OUT_DIR="${WORKING_DIR}/colors" # American English!

get_remote_schemes() {
    if [ ! -d "$LOCAL_REPO" ]; then
        git clone "$SCHEME_REPO_HTTPS" &
    else
        git --git-dir=${LOCAL_REPO}/.git pull &
    fi
    echo "Fetching latest colour schemes ..."
    wait
    echo "Done."
}

write_vim() {
    echo "let g:colors_name = 'b16-${2}'"
    printf "lua require('b16-theme').setup({"
    for c in base0{0..9} base0{A..F}; do
        printf " ${c} = '#$(sed -ne 's/'"${c}"': "\(.*\)".*/\1/p' $1)'"
        [ ${c} != "base0F" ] && printf ","
    done
    printf " })\n"
}

process_themes() {
    echo "Writing themes ..."
    for f in $LOCAL_REPO/themes/*.yaml; do
        fname=$(echo $(basename $f) | cut -f 1 -d ".")
        colours=()
        for c in base0{0..9} base0{A..F}; do
            colours+=($(sed -ne 's/'"${c}"': "\(.*\)".*/\1/p' $f))
        done
        write_vim $f $fname >${OUT_DIR}/b16-${fname}.vim &
    done
    wait
    echo "Done."
}

main() {
    get_remote_schemes
    mkdir -p $OUT_DIR
    process_themes
    # rm -rf $LOCAL_REPO
}
main
