# Build jpdfbookmarks installer - deb - 2.5.2
wget https://sourceforge.net/projects/jpdfbookmarks/files/JPdfBookmarks-2.5.2/jpdfbookmarks-2.5.2.tar.gz/download

mv download jpdfbookmarks-2.5.2.tar.gz

tar -xvzf jpdfbookmarks-2.5.2.tar.gz

mv jpdfbookmarks-2.5.2 jpdfbookmarks

rm jpdfbookmarks/jpdfbookmarks
rm jpdfbookmarks/jpdfbookmarks_cli
rm jpdfbookmarks/jpdfbookmarks.exe
rm jpdfbookmarks/jpdfbookmarks_cli.exe
rm jpdfbookmarks/link_this_in_linux_path.sh
rm jpdfbookmarks/link_this_in_linux_path_cli.sh
cd jpdfbookmarks

wget https://sourceforge.net/p/jpdfbookmarks/code/HEAD/tree/trunk/jpdfbookmarks_core/others/jpdfbookmarks48.ico?format=raw
mv jpdfbookmarks48.ico?format=raw jpdfbookmarks.ico
wget https://sourceforge.net/p/jpdfbookmarks/code/HEAD/tree/trunk/jpdfbookmarks_graphics/artwork/splash.png?format=raw
mv splash.png?format=raw splash.png
cd ..

jpackage @jpdfbookmarks.app.jpackage.settings.252 \
 @jpdfbookmarks.linux.jpackage.settings.252  \
 --add-launcher jpdfbookmarks_cli=jpdfbookmarks_cli.linux.launcher.252  \
 --linux-app-release 1 \
 --linux-deb-maintainer "Flaviano Petrocchi<flavianopetrocchi@gmail.com>" \
 --app-version 2.5.2 \
 --add-modules  java.base,java.datatransfer,java.desktop,java.management,java.naming,java.prefs,java.sql
 


# CLEAN
rm jpdfbookmarks-2.5.2.tar.gz
yes | rm -R jpdfbookmarks

# INSTALL
# sudo dpkg -i jpdfbookmarks_2.5.2-1_amd64.deb
echo "INSTALL COMMMAND:"
echo "sudo dpkg -i jpdfbookmarks_2.5.2-1_amd64.deb"
# UNINSTALL
# sudo apt remove -y jpdfbookmarks
echo "UNINSTALL COMMMAND:"
echo "sudo apt remove -y jpdfbookmarks"
