#!/bin/bash

#Get updated
#backup version. Primary on Kate

sudo add-apt-repository multiverse -y
sudo add-apt-repository universe -y
sudo dpkg --add-architecture i386
sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y

#Installs from Kubuntu repo

INSTALL_PKGS="atop btop build-essential cpupower-gui corectrl curl dmidecode dolphin flatpak htop goverlay hardinfo inxi glmark2-x11 kate libgdk-pixbuf-2.0-0 libwebkit2gtk-4.1-0 libgl1-mesa-dri:i386 libgtk-4-1 libvulkan1 libhandy-1-0 lm-sensors lutris mangohud mesa-vulkan-drivers mesa-vulkan-drivers:i386 nala neofetch nmap nvtop plasma-discover-backend-flatpak ppa-purge psensor python3-xdg radeontop sysbench software-properties-common steam time timeshift tree unrar vkmark vlc vulkan-tools x11vnc xdriinfo xrandr"

for i in $INSTALL_PKGS; do
  sudo apt-get install -y $i
done



#Downloads some of the apps I described, no installs
cd /home/$USER/Downloads/
wget -c https://github.com/DavidoTek/ProtonUp-Qt/releases/download/v2.9.1/ProtonUp-Qt-2.9.1-x86_64.AppImage
wget -c https://github.com/vagnum08/cpupower-gui/releases/download/v1.0.0/cpupower-gui_1.0.0-1_all.deb
wget -c https://github.com/flightlessmango/MangoHud/releases/download/v0.7.1/MangoHud-0.7.1.tar.gz
wget -c https://github.com/benjamimgois/goverlay/releases/download/1.0/goverlay_1.tar.xz
wget -c https://tellusim.com/download/GravityMark_1.82.run
wget -c https://cdn.geekbench.com/Geekbench-6.2.2-Linux.tar.gz
wget -c https://assets.unigine.com/d/Unigine_Heaven-4.0.run
wget -c https://github.com/lutris/lutris/releases/download/v0.5.16/lutris_0.5.16_all.deb
wget -c https://download.nomachine.com/download/8.11/Linux/nomachine_8.11.3_4_amd64.deb
wget -c https://github.com/srevinsaju/Brave-AppImage/releases/download/v1.63.161/Brave-stable-v1.63.161-x86_64.AppImage
wget -c https://github.com/AppImageCommunity/AppImageUpdate/releases/download/2.0.0-alpha-1-20230526/appimageupdatetool-x86_64.AppImage
wget -c https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/releases/download/v2.13.0/Heroic-2.13.0.AppImage
wget -c https://github.com/tkashkin/GameHub/releases/download/0.16.3-2-master/GameHub-jammy-0.16.3-2-master-9327885-x86_64.AppImage

wget -c https://gitlab.com/api/v4/projects/24386000/packages/generic/librewolf/123.0-1/LibreWolf.x86_64.AppImage
wget -c https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher-lite-2.2.0-travis995-0f91801-x86_64.AppImage
wget -c https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher_2.2.0-travis995.0f91801.xenial_amd64.deb




# extract files you just download and get permission to execute so ready to run
cd /home/$USER/Downloads/
for file in *.tar.gz; do tar -zvxf "$file"; done
for file1 in *.tar.bz2; do tar -jxf "$file1"; done
for file2 in *.tar.xz; do tar -Jxf "$file2"; done
for file3 in *.tar.zst; do tar --zstf -xf "$file3"; done

chmod a+x *.AppImage
chmod a+x *.run
chmod a+x *.deb

#Must decide if you want iperf daemon to autostart
#sudo apt install iperf3 -y

sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y

#Just show you some info about your system
#echo ""
#cat /etc/os-release | grep PRETTY_NAME=
echo ""
neofetch
# kernel version
#uname -a
echo ""

# mesa version
glxinfo | grep Mesa
echo ""

#verify running kernel driver amdgpu
lspci -k | grep -EA3 'VGA|3D|Display'
echo ""

echo ""
#list of what was installed and version number
echo "Package and Version number of those just installed "
echo ""
apt-cache show atop btop build-essential cpupower-gui corectrl curl dmidecode dolphin flatpak htop goverlay hardinfo inxi glmark2-x11 glmark2 kate libgdk-pixbuf-2.0-0 libwebkit2gtk-4.1-0 libgl1-mesa-dri:i386 libgtk-4-1 libvulkan1 libhandy-1-0 lm-sensors lutris mangohud mesa-vulkan-drivers mesa-vulkan-drivers:i386 nala neofetch nvtop plasma-discover-backend-flatpak ppa-purge psensor python3-xdg radeontop sysbench software-properties-common steam time timeshift tree unrar vkmark vlc vulkan-tools x11vnc xdriinfo xrandr | grep 'Package:\|Version'

#OR

apt-cache show $INSTALL_PKGS | grep 'Package:\|Version'
echo "Newly Installed Packages and Version Number "

#OR 
echo "View newly installed packages and version number " 
apt-cache show $INSTALL_PKGS | grep 'Package:\|Version' 


#EOF
