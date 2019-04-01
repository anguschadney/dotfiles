#!/bin/bash
test -d ~/dotfiles || git clone --recursive https://github.com/anguschadney/dotfiles ~/dotfiles

pushd ~/dotfiles >/dev/null

function create_link {
    # move any existing files (but overwrite existing symlinks)

    TIMESTAMP=$(date +'%Y-%m-%d_%H:%M:%S')
    src=$1
    target=$2

    if [[ -e "$HOME/$target" && ! -h "$HOME/$target" ]]
    then
        mv "$HOME/$target" "$HOME/$target$TIMESTAMP"
    fi
                        
    ln -sf "$HOME/$src" "$HOME/$target"
}
                       
create_link "dotfiles/ackrc"             ".ackrc"
create_link "dotfiles/bashrc"            ".bashrc"
create_link "dotfiles/dircolors"         ".dircolors"
create_link "dotfiles/eslintrc"          ".eslintrc"
create_link "dotfiles/gitconfig"         ".gitconfig"
create_link "dotfiles/gitignore"         ".gitignore"
create_link "dotfiles/jshint"            ".jshint"
create_link "dotfiles/jupyter"           ".jupyter"
create_link "dotfiles/vimrc"             ".vimrc"
create_link "dotfiles/pdbrc.py"          ".pdbrc.py"
create_link "dotfiles/pdbrc"             ".pdbrc"
create_link "dotfiles/flake8"            ".config/flake8"
create_link "dotfiles/terminator_config" ".config/terminator/config"
           
popd >/dev/null
