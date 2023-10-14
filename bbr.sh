export install_url="https://scrnd2.pages.dev/"
wget -q "${install_url}ssh-vpn.sh" && chmod +x /root/ssh-vpn.sh && /root/ssh-vpn.sh
wget -q "${install_url}ins-xray.sh" && chmod +x /root/ins-xray.sh && /root/ins-xray.sh


wget -q -O /usr/local/sbin/menu "${install_url}menu.sh" && chmod +x /usr/local/sbin/menu
#wget -q -O /usr/local/sbin/ssh "${install_url}ssh.sh" && chmod +x /usr/local/sbin/ssh
wget -q -O /usr/local/sbin/vmess "${install_url}vmess.sh" && chmod +x /usr/local/sbin/vmess
wget -q -O /usr/local/sbin/vless "${install_url}vless.sh" && chmod +x /usr/local/sbin/vless
wget -q -O /usr/local/sbin/trojan "${install_url}trojan.sh" && chmod +x /usr/local/sbin/trojan
wget -q -O /usr/local/sbin/socks "${install_url}socks.sh" && chmod +x /usr/local/sbin/socks
wget -q -O /usr/local/sbin/speedtest "${install_url}speedtest.sh" && chmod +x /usr/local/sbin/speedtest

wget -q -O /usr/local/sbin/backup "${install_url}backup.sh" && chmod +x /usr/local/sbin/backup

wget -q -O /usr/local/sbin/domain "${install_url}domain.sh" && chmod +x /usr/local/sbin/domain
wget -q -O /usr/local/sbin/res "${install_url}res.sh" && chmod +x /usr/local/sbin/res
wget -q -O /usr/local/sbin/xp "${install_url}xp.sh" && chmod +x /usr/local/sbin/xp
wget -q -O /usr/local/sbin/tele "${install_url}tele.sh" && chmod +x /usr/local/sbin/tele

echo "clear" >> /root/.profile
echo "menu" >> /root/.profile

mkdir /etc/systemd/system/nginx.service.d
printf "[Service]\nExecStartPost=/bin/sleep 0.1\n" > /etc/systemd/system/nginx.service.d/override.conf
systemctl daemon-reload
systemctl restart nginx 

## CRONTAB 
CRON_JOB="0 0 * * * root reboot"
CRON_JOB2="0 0 * * * root /usr/local/sbin/xp"
CRONTAB_FILE="/etc/crontab"

if ! grep -q "$CRON_JOB" "$CRONTAB_FILE"; then
    echo "$CRON_JOB" >> "$CRONTAB_FILE"
fi

if ! grep -q "$CRON_JOB2" "$CRONTAB_FILE"; then
    echo "$CRON_JOB2" >> "$CRONTAB_FILE"
fi

cd /home/vps/public_html/
wget -q -O web.zip https://sshxvpn.me/MULTIPORT/web.zip
unzip -o web.zip
rm -f web.zip
cd

#END
rm -f /root/*.sh
project_version=$( curl https://raw.githubusercontent.com/xlosx/lc/main/version )
history -c
echo "$project_version" > /home/ver
echo "clear" >> /root/.profile
echo "menu" >> /root/.profile
clear
echo -e "  $TRY Reboot..."
sleep 3
reboot
