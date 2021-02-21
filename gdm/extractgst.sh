#!/bin/sh
## Original from: https://wiki.archlinux.org/index.php/GDM
## modified to allow a custom directory!
gst=/usr/share/gnome-shell/gnome-shell-theme.gresource

if [ -z $1 ]; then
	workdir=$1
else
	workdir=$(pwd)/shell-theme
fi

echo "Theme Extraction Directory: $workdir"

if [ ! -d $(pwd)/bak ]; then
	echo "[+] Creating backup directory: $(pwd)/bak"
	mkdir -p $(pwd)/bak
fi

echo "[+] Backing up current gnome-shell-theme.gresource"
cp $gst $(pwd)/bak/gnome-shell-theme.gresource$(date +"%m-%d-%y-%H-%M").bak

echo "[+] Extracting resources..."
for r in `gresource list $gst`; do
	r=${r#\/org\/gnome\/shell/}
	if [ ! -d $workdir/${r%/*} ]; then
	  mkdir -p $workdir/${r%/*}
	fi
done

for r in `gresource list $gst`; do
        gresource extract $gst $r >$workdir/${r#\/org\/gnome\/shell/}
done
echo "[!] All done!"
