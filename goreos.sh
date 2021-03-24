#!/bin/bash
yes | sudo pacman -S dialog &&
cmd=(dialog --keep-tite --menu "GoreOS" 22 76 16)

options=(1 "Main Packages"
         2 "Extra Packages"
         3 "Config")

choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

for choice in $choices
do
    case $choice in
		1)
            yes | sudo pacman -S openbox openbox-themes-extra obconf obkey-gtk3 obmenu-generator polybar lxappearance feh skippy-xd conky dunst rofi qt5-styleplugins terminus-font xcursor-breeze papirus-icon-theme lightdm-gtk-greeter-settings neofetch manjaro-settings-manager pamac arandr picom gparted htop xclip xsel gnome-disk-utility xfce4-power-manager git lxsession gtk2-perl perl-file-desktopentry nano wine-staging xarchiver pcmanfm p7zip termite micro mousepad viewnior galculator etcher scrot pavucontrol qjackctl jack2 brave gimp audacity vlc moc transmission-gtk uget simplescreenrecorder &&
            lxpolkit &&
            yes | pamac build sweet-theme-git sweet-theme-dark beautyline dropbox dropbox-cli &&
            ./goreos.sh
            ;;
		2)
            yes | sudo pacman -S inkscape kdenlive blender obs-studio steam discord handbrake nicotine+ soundconverter &&
            yes | pamac build zoom franz-bin
            ./goreos.sh
            ;;
		3)
            cp -R .config/ $HOME/ &&
            cp -R .themes $HOME/ &&
            echo "All done! Congratulations, cunt!"
            ;;
    esac
done
