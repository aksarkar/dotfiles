sudo iptables -t nat -A OUTPUT -p tcp --dport 1935 -j REDIRECT
rtmpsuck
sudo iptables -t nat -D OUTPUT -p tcp --dport 1935 -j REDIRECT
