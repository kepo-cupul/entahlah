#!/bin/bash
bash /1.sh

git clone https://SanzGanzs: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@github.com/SanzGanzs/info-judul a
cd a && npm i
npm i -g pm2

url="http://127.0.0.1:4040/api/tunnels"

sleep 20s

response=$(curl -s $url)

echo $response
