# Build jpdfbookmarks installer - deb - 2.5.4
wget https://github.com/life888888/JPdfBookmarks/releases/download/v2.5.4/jpdfbookmarks-2.5.4.tar.gz

tar -xvzf jpdfbookmarks-2.5.4.tar.gz

mv jpdfbookmarks-2.5.4 jpdfbookmarks

rm jpdfbookmarks/jpdfbookmarks
rm jpdfbookmarks/jpdfbookmarks_cli
rm jpdfbookmarks/jpdfbookmarks.exe
rm jpdfbookmarks/jpdfbookmarks_cli.exe
rm jpdfbookmarks/jpdfbookmarks.l4j.ini
rm jpdfbookmarks/jpdfbookmarks_cli.l4j.ini
rm jpdfbookmarks/link_this_in_linux_path.sh
rm jpdfbookmarks/link_this_in_linux_path_cli.sh
cd jpdfbookmarks

wget https://github.com/life888888/JPdfBookmarks/raw/main/jpdfbookmarks_core/src/main/images/jpdfbookmarks.ico
wget https://github.com/life888888/JPdfBookmarks/raw/main/jpdfbookmarks_core/src/main/resources/it/flavianopetrocchi/jpdfbookmarks/splash.png
cd ..

jpackage @jpdfbookmarks.app.jpackage.settings \
 @jpdfbookmarks.linux.jpackage.settings  \
 --add-launcher jpdfbookmarks_cli=jpdfbookmarks_cli.linux.launcher  \
 --linux-app-release 1 \
 --linux-deb-maintainer "Flaviano Petrocchi<flavianopetrocchi@gmail.com>" \
 --app-version 2.5.4 \
 --add-modules  java.base,java.datatransfer,java.desktop,java.management,java.naming,java.prefs,java.sql


# CLEAN
rm jpdfbookmarks-2.5.4.tar.gz
yes | rm -R jpdfbookmarks

# INSTALL
# sudo dpkg -i jpdfbookmarks_2.5.4-1_amd64.deb
echo "INSTALL COMMMAND:"
echo "sudo dpkg -i jpdfbookmarks_2.5.4-1_amd64.deb"
# UNINSTALL
# sudo apt remove -y jpdfbookmarks
echo "UNINSTALL COMMMAND:"
echo "sudo apt remove -y jpdfbookmarks"
