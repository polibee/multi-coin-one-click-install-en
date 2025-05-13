#!/bin/bash

echo "Installing dependencies..."
sudo apt update
sudo apt install -y build-essential cmake libuv1-dev libssl-dev libhwloc-dev wget

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
echo "Use the following command to run xmrig in the background:"
echo "screen -S xmrig -dm ~/xmrig-6.22.2/build/xmrig -a rx -o stratum+ssl://rx.unmineable.com:443 -u DOGE:DKEfmGknGtdY9gEs4YJS9fTSmAtH7eAUdn.unmineable_worker_tiahnyqc#dsti-8isi --log-file xmrig.log"
echo "To list all screen sessions, run:"
echo "screen -ls"
echo "To find the xmrig screen session ID, run:"
echo "screen -ls | grep xmrig"
echo "To view the xmrig log, run the following (replace 12345.xmrig with your actual session ID):"
echo "screen -r 12345.xmrig"
echo "To uninstall xmrig, run the following command:"
echo "sudo rm -rf ~/xmrig-6.22.2"
