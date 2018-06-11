DOTS="vim vimrc bashrc bash_profile"

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
                continue
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

main() {
    for file in $DOTS; do
        dst="$HOME/.$file"
        src=$PWD/$file

        echo "checking: $dst"
        check_exists $dst
        link_file $src $dst
    done
}

main
