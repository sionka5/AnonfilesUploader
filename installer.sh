#!/bin/bash
# Bash Script for install Fsociety tools
# Must run to install tool

clear
echo "
░██████╗██╗░█████╗░███╗░░██╗░██████╗░██╗░░░██╗███████╗
██╔════╝██║██╔══██╗████╗░██║██╔════╝░██║░░░██║╚════██║
╚█████╗░██║██║░░██║██╔██╗██║██║░░██╗░██║░░░██║░░███╔═╝
░╚═══██╗██║██║░░██║██║╚████║██║░░╚██╗██║░░░██║██╔══╝░░
██████╔╝██║╚█████╔╝██║░╚███║╚██████╔╝╚██████╔╝███████╗
╚═════╝░╚═╝░╚════╝░╚═╝░░╚══╝░╚═════╝░░╚═════╝░╚══════╝

██╗███╗░░██╗██████╗░██╗░░░██╗░██████╗████████╗██████╗░██╗███████╗░██████╗
██║████╗░██║██╔══██╗██║░░░██║██╔════╝╚══██╔══╝██╔══██╗██║██╔════╝██╔════╝
██║██╔██╗██║██║░░██║██║░░░██║╚█████╗░░░░██║░░░██████╔╝██║█████╗░░╚█████╗░
██║██║╚████║██║░░██║██║░░░██║░╚═══██╗░░░██║░░░██╔══██╗██║██╔══╝░░░╚═══██╗
██║██║░╚███║██████╔╝╚██████╔╝██████╔╝░░░██║░░░██║░░██║██║███████╗██████╔╝
╚═╝╚═╝░░╚══╝╚═════╝░░╚═════╝░╚═════╝░░░░╚═╝░░░╚═╝░░╚═╝╚═╝╚══════╝╚═════╝░
";



if [ "$PREFIX" = "/data/data/com.termux/files/usr" ]; then
    INSTALL_DIR="$PREFIX/usr/share/doc/AnonfilesUploader"
    BIN_DIR="$PREFIX/bin/"
    BASH_PATH="$PREFIX/bin/bash"
    TERMUX=true

    pkg install -y git python2
elif [ "$(uname)" = "Darwin" ]; then
    INSTALL_DIR="/usr/local/AnonfilesUploader"
    BIN_DIR="/usr/local/bin/"
    BASH_PATH="/bin/bash"
    TERMUX=false
else
    INSTALL_DIR="$HOME/.AnonfilesUploader"
    BIN_DIR="/usr/local/bin/"
    BASH_PATH="/bin/bash"
    TERMUX=false

    sudo apt-get install -y git python2.7
fi

echo "[✔] Checking directories...";
if [ -d "$INSTALL_DIR" ]; then
    echo "[◉] A directory AnonfilesUploader was found! Do you want to replace it? [Y/n]:" ;
    read -r mama
    if [ "$mama" = "y" ]; then
        if [ "$TERMUX" = true ]; then
            rm -rf "$INSTALL_DIR"
            rm "$BIN_DIR/AnonfilesUploader*"
        else
            sudo rm -rf "$INSTALL_DIR"
            sudo rm "$BIN_DIR/AnonfilesUploader*"
        fi
    else
        echo "[✘] If you want to install you must remove previous installations [✘] ";
        echo "[✘] Installation failed! [✘] ";
        exit
    fi
fi
echo "[✔] Cleaning up old directories...";
if [ -d "$ETC_DIR/Manisso" ]; then
    echo "$DIR_FOUND_TEXT"
    if [ "$TERMUX" = true ]; then
        rm -rf "$ETC_DIR/Manisso"
    else
        sudo rm -rf "$ETC_DIR/Manisso"
    fi
fi

echo "[✔] Installing ...";
echo "";
git clone --depth=1 https://github.com/sionka5/AnonfilesUploader"$INSTALL_DIR";
echo "#!$BASH_PATH
python $INSTALL_DIR/AnonfilesUploader.py" "${1+"$@"}" > "$INSTALL_DIR/AnonfilesUploader";
chmod +x "$INSTALL_DIR/fsociety";

fi
rm "$INSTALL_DIR/AnonfilesUploader";


if [ -d "$INSTALL_DIR" ] ;
then
    echo "";
    echo "[✔] Tool installed successfully! [✔]";
    echo "";
    echo "[✔]====================================================================[✔]";
    echo "[✔]      All is done!! You can execute tool by typing fsociety !       [✔]";
    echo "[✔]====================================================================[✔]";
    echo "";
else
    echo "[✘] Installation failed! [✘] ";
    exit
fi