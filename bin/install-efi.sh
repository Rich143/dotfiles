#!/bin/bash

set -x

EFI_FILE=""
EFI_UPDATER=""
REMOTE_PATH="/Volumes/local/"
REMOTE=""

REMOTE_EFI_DIR="Desktop"

function remoteCopy()
{
    expect_file=$(mktemp)
    cat <<EOF > $expect_file
spawn scp $1 "local@$REMOTE:$REMOTE_EFI_DIR/$(basename $1)"
#######################
expect {
  -re ".*sword.*" {
    exp_send "local\r"
  }
  -re ".*es.*o.*" {
    exp_send "yes\r"
    exp_continue
  }
}
interact
EOF
    /usr/bin/expect $expect_file || exit 1
    rm -f $expect_file
}

function remoteCopyRecursive()
{
    expect_file=$(mktemp)
    cat <<EOF > $expect_file
spawn scp -r $1 "local@$REMOTE:$REMOTE_EFI_DIR/$(basename $1)"
#######################
expect {
  -re ".*sword.*" {
    exp_send "local\r"
  }
  -re ".*es.*o.*" {
    exp_send "yes\r"
    exp_continue
  }
}
interact
EOF
    /usr/bin/expect $expect_file || exit 1
    rm -f $expect_file
}

function sshCommand()
{
    ssh_file=$(mktemp)
    cat <<EOF > $ssh_file
spawn ssh local@$REMOTE $1
expect "assword:"
send "local\r"
interact
EOF
    /usr/bin/expect $ssh_file || exit 1
    rm -f $ssh_file
}


function usage()
{
    echo "Usage:"
    echo "Copy {EFI_FILE} to the remote machine with HOSTNAME={REMOTE} at smb folder {REMOTE_PATH}, then run efi firmware updater with that file"
    echo "./install_efi.sh"
    echo "\t-h --help"
    echo "\t--efi-file={EFI_FILE}"
    echo "\t[--remote-path=$REMOTE_PATH]"
    echo "\t--remote={REMOTE}"
    echo ""
}

while [ "$1" != "" ]; do
    PARAM=`echo $1 | awk -F= '{print $1}'`
    VALUE=`echo $1 | awk -F= '{print $2}'`
    case $PARAM in
        -h | --help)
            usage
            exit
            ;;
        --efi-file)
            EFI_FILE=$VALUE
            ;;
        --efi-updater)
            EFI_UPDATER=$VALUE
            ;;
        --remote-path)
            REMOTE_PATH=$VALUE
            ;;
        --remote)
            REMOTE=$VALUE
            ;;
        *)
            echo "ERROR: unknown parameter \"$PARAM\""
            usage
            exit 1
            ;;
    esac
    shift
done

if [ -z "$EFI_FILE" ] || [ -z "$REMOTE"] || [ -z "$EFI_UPDATER"]; then
    usage
    exit
fi

#echo "cp $EFI_FILE $REMOTE_PATH/$REMOTE_EFI_DIR/"
#cp $EFI_FILE $REMOTE_PATH/$REMOTE_EFI_DIR/ || exit 1
#cp -r "$EFI_UPDATER/EFI-Firmware-Updater.app" "$REMOTE_PATH/$REMOTE_EFI_DIR/" || exit 1
#cp "$EFI_UPDATER/boot.efi" "$REMOTE_PATH/$REMOTE_EFI_DIR/" || exit 1

echo "cp $EFI_FILE $REMOTE_PATH/$REMOTE_EFI_DIR/"
remoteCopy $EFI_FILE || exit 1
remoteCopyRecursive "$EFI_UPDATER/EFI-Firmware-Updater.app" || exit 1
remoteCopy "$EFI_UPDATER/boot.efi" || exit 1

script_file=$(mktemp)
#ssh_file=$(mktemp)

cat <<EOF > $script_file
spawn sudo /Users/local/$REMOTE_EFI_DIR/EFI-Firmware-Updater.app/Contents/MacOS/EFI-Firmware-Updater -remote -y -force -o /Users/local/$REMOTE_EFI_DIR/$(basename $EFI_FILE)
expect "assword:"
send "local\r"
interact
EOF

#cp $script_file $REMOTE_PATH/$REMOTE_EFI_DIR/efi-update.exp || exit 1
mv $script_file $(dirname $script_file)/efi-update.exp
script_file=$(dirname $script_file)/efi-update.exp
remoteCopy $script_file || exit 1
rm -f $script_file
script_file=$(basename $script_file)

#spawn ssh local@$REMOTE "/Users/local/$REMOTE_EFI_DIR/EFI-Firmware-Updater.app/Contents/MacOS/EFI-Firmware-Updater -force -o $REMOTE_PATH/$REMOTE_EFI_DIR/$(basename $EFI_FILE)"
#cat <<EOF > $ssh_file
#spawn ssh local@$REMOTE "expect /Users/local/$REMOTE_EFI_DIR/efi-update.exp"
#expect "assword:"
#send "local\r"
#interact
#EOF
#/usr/bin/expect $ssh_file

sshCommand "\"expect /Users/local/$REMOTE_EFI_DIR/$script_file\""
#rm -f $ssh_file
