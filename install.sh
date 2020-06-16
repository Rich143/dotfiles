DOTS="vim vimrc tmux.conf zshrc gitconfig ag-ignore ctags"

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

install_zinit() {
    ZINIT_DIRECTORY=~/.zinit
    if [ ! -d "$ZINIT_DIRECTORY" ]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
    fi
}

main() {
    install_zinit

    for file in $DOTS; do
        dst="$HOME/.$file"
        src=$PWD/$file

        echo "checking: $dst"
        check_exists $dst
        local res=$?
        if [ $res -ne 0 ]; then
            link_file $src $dst
        fi
    done
}

main
