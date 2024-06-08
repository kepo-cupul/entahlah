#!/bin/bash
bash /1.sh


url="http://127.0.0.1:4040/api/tunnels"

sleep 20s

response=$(curl -s $url)

echo $response
