function error_exit(){
    print $@
    exit 1
}

apt-get install wget lib32gcc1 || error_exit "could not install debian packages"

[[ -d data ]] || mkdir data || error_exit "cloud not create dir data"
cd data

if [ ! -f steamcmd.sh ]; then
    wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz || error_exit "failed to download steamcmd.sh"
    tar xvzf steamcmd_linux.tar.gz || error_exit "failed to extract steam"
    rm steamcmd_linux.tar.gz
fi

./steamcmd.sh +login anonymous +force_install_dir ./7daysded +app_update 294420 validate +quit || error_exit "failed to download game from steam"

if [ -d "Mods" ]; then
    rm -rf Mods || error_exit "failed to remove Mods folder"
fi

wget http://illy.bz/fi/7dtd/server_fixes.tar.gz || error_exit "failed to downloaded Alloc's server fixes"
tar xvzf server_fixes.tar.gz || "failed to extract Alloc's server fixes"
rm server_fixes.tar.gz
