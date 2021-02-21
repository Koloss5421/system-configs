# gnome-shell-theme.gresource customization
Reference from https://wiki.archlinux.org/index.php/GDM#Log-in_screen_background_image


 - use ```extractgst.sh <path>``` to backup the current gnome-shell-theme.gresource and to extract the files!
 - I used ```tree -if >> files.txt``` to create a list of files within the shell-theme/theme directory.
 - Then used VIM sed to replace the front with <file> and the end with </file> to add to the gnome-shell-theme.gresource.xml
    - be sure to remove files that don't make sense from the list like /theme alone
 - Added my image to that list as well. My files were different than the ones listed on the wiki.
 - I modified gnome-shell.css to create custom background as well as change the clock and text to black.
 - run ```glib-compile-resources gnome-shell-theme.gresource.xml``` to create the gresource file.
 - run ```sudo cp gnome-shell-theme.gresource /usr/share/gnome-shell/``` to cp the file to the folder and check you lock screen!
