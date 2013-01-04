#!/usr/bin/env bash

# prepare .vim and .vimrc

for filename in ~/.vimrc ~/.vim; do
    if [ -e $filename ]; then
        echo "$filename will be deleted. Do you want to continue? [n]"
        read -s answer
        if [ "$answer" != "y" ]; then
            exit 0
        fi
    fi
done

rm -rf ~/.vim
rm ~/.vimrc

mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/bundle

# checkout pathogen

curl -Sso ~/.vim/autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

# checkout plugins, colorschemes etc.

cd ~/.vim/bundle

git clone git://github.com/Rip-Rip/clang_complete.git
git clone git://github.com/altercation/vim-colors-solarized.git
git clone git://github.com/klen/python-mode.git
git clone git://github.com/mileszs/ack.vim.git
git clone git://github.com/msanders/snipmate.vim.git
git clone git://github.com/scrooloose/nerdtree.git
git clone git://github.com/scrooloose/syntastic.git
git clone git://github.com/vim-scripts/a.vim.git

# checkout .vimrc

curl -Sso ~/.vimrc \
    https://github.com/DrSmithization/staff/raw/master/vim/.vimrc
