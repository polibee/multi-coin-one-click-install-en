#!/bin/bash

echo "Installing dependencies..."
sudo apt update
sudo apt install -y build-essential cmake libuv1-dev libssl-dev libhwloc-dev wget screen

echo "Downloading xmrig v6.22.2 source code..."
sudo wget -O v6.22.2.tar.gz https://github.com/xmrig/xmrig/archive/refs/tags/v6.22.2.tar.gz
sudo tar -zxvf v6.22.2.tar.gz

echo "Compiling xmrig..."
cd xmrig-6.22.2
sudo mkdir build
cd build
sudo cmake ..
sudo make

echo "Starting xmrig..."
screen -S xmrig -dm ~/xmrig-6.22.2/build/xmrig -a rx -o stratum+ssl://rx.unmineable.com:443 -u DOGE:DKEfmGknGtdY9gEs4YJS9fTSmAtH7eAUdn.unmineable_worker_vvefcfdy#dsti-8isi -p x --log-file xmrig.log

echo "xmrig is now running in the background using screen."

echo ""
echo "Helpful commands:"
echo "To list all screen sessions:       screen -ls"
echo "To reattach to xmrig session:      screen -r xmrig"
echo "To detach from screen (keep running): Ctrl + A, then D"
echo "To view xmrig log file:            tail -f ~/xmrig-6.22.2/build/xmrig.log"
echo "To uninstall xmrig:                sudo rm -rf ~/xmrig-6.22.2"
