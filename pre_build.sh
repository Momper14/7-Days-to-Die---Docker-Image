apt-get install wget lib32gcc1

cd data

if [ ! -f steamcmd.sh ]; then
    wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz
    tar xvzf steamcmd_linux.tar.gz
    rm steamcmd_linux.tar.gz
fi

./steamcmd.sh +login anonymous +force_install_dir ./7daysded +app_update 294420 validate +quit

if [ -d "Mods" ]; then
    rm -rf Mods
fi

wget http://illy.bz/fi/7dtd/server_fixes.tar.gz
tar xvzf server_fixes.tar.gz
rm server_fixes.tar.gz