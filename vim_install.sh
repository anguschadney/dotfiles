#!/bin/bash
test -d ~/.vim/autoload || mkdir -p ~/.vim/autoload
test -d ~/.vim/bundle || mkdir -p ~/.vim/bundle

# install pathogen
echo -e "Installing pathogen\n"
cd ~/.vim/autoload
test -e pathogen.vim || curl -LSso pathogen.vim https://tpo.pe/pathogen.vim

# install fonts and symbols for airline
echo -e "Installing fonts\n"
test -d ~/.local/share/fonts || mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
test -e "Ubuntu Mono derivative Powerline Nerd Font Complete Mono.ttf" || curl -fLo "Ubuntu Mono derivative Powerline Nerd Font Complete Mono.ttf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/UbuntuMono/Regular/complete/Ubuntu%20Mono%20derivative%20Powerline%20Nerd%20Font%20Complete%20Mono.ttf

function install_plugin {
    # clone into plugins directory if dest doesn't exist
    path=$1
    name=${path##*/}
    cd ~/.vim/bundle
    echo "Installing $name"
    test -d $name || git clone "git://github.com/$path"
}

install_plugin "chrisbra/csv.vim"
install_plugin "ctrlpvim/ctrlp.vim"
install_plugin "sjl/gundo.vim"
install_plugin "davidhalter/jedi-vim"
install_plugin "scrooloose/nerdcommenter"
install_plugin "scrooloose/nerdtree"
install_plugin "albfan/nerdtree-git-plugin"
install_plugin "hdima/python-syntax"
install_plugin "scrooloose/syntastic"
install_plugin "bling/vim-airline"
install_plugin "Townk/vim-autoclose"
install_plugin "altercation/vim-colors-solarized"
install_plugin "ryanoasis/vim-devicons"
install_plugin "tpope/vim-fugitive"
install_plugin "airblade/vim-gitgutter"
install_plugin "pangloss/vim-javascript"
install_plugin "hynek/vim-python-pep8-indent"
