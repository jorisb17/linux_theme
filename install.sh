#Install all programs available with apt
yes | sudo apt install wget git telegram-desktop avrdude gnome-tweaks chromium

yes | sudo snap install code discord spotify

#Install gitkraken
wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
sudo dpkg -i gitkraken-amd64.deb
rm -f gitkraken-amd64.deb

#Install MS teams
wget https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/teams_1.3.00.5153_amd64.deb
sudo apt install ./teams_1.3.00.5153_amd64.deb
rm -f teams_1.3.00.5153_amd64.deb

#Enable extensions
gnome-shell-extension-tool -e user-theme
gnome-shell-extension-tool -e dash-to-dock
gnome-shell-extension-tool -e gsconnect

#Configure Dock
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode FIXED
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 64
gsettings set org.gnome.shell.extensions.dash-to-dock unity-backlit-items true

mkdir ~/.themes

#Download and install Nordic theme
wget https://github.com/EliverLara/Nordic/releases/download/v1.9.0/Nordic.tar.xz

tar -xf Nordic.tar.xz -C ~/.themes

rm -r -f Nordic.tar.xz

gsettings set org.gnome.desktop.interface gtk-theme "Nordic"
gsettings set org.gnome.desktop.wm.preferences theme "Nordic"

git clone https://github.com/arcticicestudio/nord-gnome-terminal.git
cd nord-gnome-terminal/src

./nord.sh

cd ../..

rm -r -f nord-gnome-terminal

#Install gnome-kde-dynamic-wallpaper-catalina
git clone https://github.com/japamax/gnome-kde-catalina-dynamic-wallpaper.git
cd gnome-kde-catalina-dynamic-wallpaper

sudo mkdir -p /usr/share/dynamicwallpapers/catalina-solar/contents/images
sudo cp catalina/* /usr/share/dynamicwallpapers/catalina-solar/contents/images
sudo chmod 755 /usr/share/dynamicwallpapers/catalina-solar/contents/images
sudo chmod 644 /usr/share/dynamicwallpapers/catalina-solar/contents/images/*

sudo mkdir -p /usr/share/dynamicwallpapers/catalina-timed/contents
sudo chmod 755 /usr/share/dynamicwallpapers/catalina-timed/contents 
sudo ln -s /usr/share/dynamicwallpapers/catalina-solar/contents/images /usr/share/dynamicwallpapers/catalina-timed/contents/images 

sudo mkdir -p /usr/share/backgrounds/macOS
sudo ln -s /usr/share/dynamicwallpapers/catalina-solar/contents/images /usr/share/backgrounds/macOS/catalina

sudo cp catalina-solar.json /usr/share/dynamicwallpapers/catalina-solar/metadata.json
sudo chmod 644 /usr/share/dynamicwallpapers/catalina-solar/metadata.json

sudo cp catalina-timed.json /usr/share/dynamicwallpapers/catalina-timed/metadata.json
sudo chmod 644 /usr/share/dynamicwallpapers/catalina-timed/metadata.json

sudo cp catalina-timed.xml /usr/share/backgrounds/macOS/catalina-timed.xml
sudo chmod 644 /usr/share/backgrounds/macOS/catalina-timed.xml

sudo mkdir -p /usr/share/gnome-background-properties
sudo cp catalina.xml /usr/share/gnome-background-properties/catalina.xml 
sudo chmod 644 /usr/share/gnome-background-properties/catalina.xml

cd ..

rm -r -f gnome-kde-catalina-dynamic-wallpaper

gsettings set org.gnome.desktop.background picture-uri file:////usr/share/backgrounds/macOS/catalina-timed.xml
