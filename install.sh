#!/bin/bash


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
    INSTALL_DIR="$PREFIX/usr/share/doc/anonfilesuploader"
    BIN_DIR="$PREFIX/bin/"
    BASH_PATH="$PREFIX/bin/bash"
    TERMUX=true

elif [ "$(uname)" = "Darwin" ]; then
    INSTALL_DIR="/usr/local/anonfilesuploader"
    BIN_DIR="/usr/local/bin/"
    BASH_PATH="/bin/bash"
    TERMUX=false
else
    INSTALL_DIR="$HOME/.anonfilesuploader"
    BIN_DIR="/usr/local/bin/"
    BASH_PATH="/bin/bash"
    TERMUX=false

fi

echo "[✔] Checking directories...";
if [ -d "$INSTALL_DIR" ]; then
    echo "[◉] A directory anonfilesuploader was found! Do you want to replace it? [Y/n]:" ;
    read -r mama
    if [ "$mama" = "y" ]; then
        if [ "$TERMUX" = true ]; then
            rm -rf "$INSTALL_DIR"
            rm "$BIN_DIR/anonfilesuploader*"
        else
            sudo rm -rf "$INSTALL_DIR"
            sudo rm "$BIN_DIR/anonfilesuploader*"
        fi
    else
        echo "[✘] If you want to install you must remove previous installations [✘] ";
        echo "[✘] Installation failed! [✘] ";
        exit
    fi
fi
echo "[✔] Cleaning up old directories...";
if [ -d "$ETC_DIR/Sionguz" ]; then
    echo "$DIR_FOUND_TEXT"
    if [ "$TERMUX" = true ]; then
        rm -rf "$ETC_DIR/Sionguz"
    else
        sudo rm -rf "$ETC_DIR/Sionguz"
    fi
fi

echo "[✔] Installing ...";
echo "";
git clone --depth=1 https://github.com/Sionka5/AnonfilesUploader "$INSTALL_DIR";
echo "#!$BASH_PATH
python $INSTALL_DIR/AnonUploader.py" "${1+"$@"}" > "$INSTALL_DIR/anonfilesuploader";
chmod +x "$INSTALL_DIR/anonfilesuploader";
if [ "$TERMUX" = true ]; then
    cp "$INSTALL_DIR/anonfilesuploader" "$BIN_DIR"
    
else
    sudo cp "$INSTALL_DIR/anonfilesuploader" "$BIN_DIR"
    
fi
rm "$INSTALL_DIR/anonfilesuploader";


if [ -d "$INSTALL_DIR" ] ;
then
    echo "";
    echo "[✔] Tool installed successfully! [✔]";
    echo "";
    echo "[✔]====================================================================[✔]";
    echo "[✔]    All is done!! You can execute tool by typing  ! anonuploader    [✔]";
    echo "[✔]====================================================================[✔]";
    echo "";
else
    echo "[✘] Installation failed! [✘] ";
    exit
fi
