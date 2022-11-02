#!/bin/sh

SCHEME_REPO_NAME="base16-schemes"
SCHEME_REPO_HTTPS="https://github.com/tinted-theming/base16-schemes.git"
WORKING_DIR="$(dirname $(realpath $0))"
LOCAL_REPO="${WORKING_DIR}/${SCHEME_REPO_NAME}"
TMP_DIR="${WORKING_DIR}/schemes"
VIM_DIR="${WORKING_DIR}/colors" # i know, i know, colour is spelt wrong, but its a standard path for neovim
LUA_DIR="${WORKING_DIR}/lua"

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

write_vim () {
    echo "let g:colors_name = 'b16-${2}'"
    echo "lua require('b16-theme').setup({"
    for c in base0{0..9} base0{A..F}
    do
        printf "    \ ${c} = '#`sed -ne 's/'"${c}"': "\(.*\)".*/\1/p' $1`'"
        [ ${c} != "base0F" ] && printf ","
        printf "\n"
    done
    printf "\}\n"
}

process_themes() {
    echo "Writing themes ..."
    for f in $TMP_DIR/*.yaml
    do
        fname=$(echo $(basename $f) | cut -f 1 -d ".")
        write_vim $f $fname > ${VIM_DIR}/b16-${fname}.vim &
    done
    wait
    echo "Done."
}

main() {
    mkdir -p $TMP_DIR
    mkdir -p $VIM_DIR
    mkdir -p $LUA_DIR
#    get_schemes
#    cp $SCHEME_REPO_NAME/*.yaml schemes/
    process_themes
}

main
