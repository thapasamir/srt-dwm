
exec dwm & 

dwmbar 2>&1 >/dev/null &

exec picom

while :; do
	ssh-agent dwm
done
