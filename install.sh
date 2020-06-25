DOTS="vim vimrc tmux.conf zshrc gitconfig ag-ignore ctags gitignore hammerspoon"

check_exists() {
    file=$1

    if [ -L $file -o -f $file -o -d $file ]; then
        echo "File exists already: $file"
        read -p "Do you want to delete it? " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]];
        then
            rm -f $file
        else
            read -p "Do you want to save a backup and replace it? " -n 1 -r
            echo
            if [[ $REPLY =~ ^[Yy]$ ]];
            then
                echo "Moving $file to $file.bak"
                echo "mv $file $file.bak"
                mv $file $file.bak
            else
                echo "Skipping $file"
                return 1
            fi
        fi
    fi
}

link_file() {
    src=$1
    dst=$2

    echo "linking $src to $dst"
    ln -s $src $dst
}

install_homebrew() {
    echo "Checking if homebrew installed"
    if command -v brew >/dev/null 2>&1; then
        echo "Homebrew already installed"
    else
        /bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    fi
}

install_homebrew_packages() {
    if brew ls --versions the_silver_searcher > /dev/null; then
        echo "the_silver_searcher installed already"
    else
        brew install the_silver_searcher
    fi

    if brew ls --versions universal-ctags > /dev/null; then
        echo "universal-ctags installed already"
    else
        brew tap universal-ctags/universal-ctags
        brew install --with-jansson --HEAD universal-ctags/universal-ctags/universal-ctags
    fi

    if brew ls --versions macvim > /dev/null; then
        echo "macvim installed already"
    else
        brew install macvim
    fi

    if brew ls --versions bear > /dev/null; then
        echo "bear installed already"
    else
        brew install bear
    fi

    if brew ls --versions llvm > /dev/null; then
        echo "llvm installed already"
    else
        brew install llvm && echo  "llvm installed, to setup clangd, symlink clangd into your path"
    fi

    if [ -d ~/.hammerspoon ]; then
        echo "hammerspoon installed already"
    else
        brew cask install hammerspoon
    fi

    if brew ls --versions pyenv > /dev/null; then
        echo "pyenv installed already"
    else
        brew install pyenv
    fi

    if brew ls --versions pyenv > /dev/null; then
        echo "fira-mono nerf font installed already"
    else
        brew tap homebrew/cask-fonts
        brew install font-fira-mono-nerd-font
    fi

}

install_zinit() {
    ZINIT_DIRECTORY=~/.zinit
    if [ ! -d "$ZINIT_DIRECTORY" ]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
    fi
}

# Install node_js, required for coc.nvim
install_node_js() {
    echo "Checking if node.js installed"
    if command -v node >/dev/null 2>&1; then
        echo "node.js already installed"
    else
        curl -sL install-node.now.sh/lts | zsh
    fi
}

main() {
    install_homebrew
    install_homebrew_packages
    install_zinit
    install_node_js

    for file in $DOTS; do
        dst="$HOME/.$file"
        src=$PWD/$file

        echo "checking: $dst"
        check_exists $dst
        local res=$?
        if [ $res -eq 0 ]; then
            link_file $src $dst
        fi
    done
}

main
