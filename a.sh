#!/bin/bash
bash /1.sh

git clone https://SanzGanzs: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@github.com/SanzGanzs/info-judul a
cd a && npm i
npm i -g pm2

url="http://127.0.0.1:4040/api/tunnels"

sleep 20s

response=$(curl -s $url)

echo $response
