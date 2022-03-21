# Build jpdfbookmarks installer - rpm - 2.5.2
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

cp linuxOverride/jpdfbookmarks.spec.2.5.2 linuxOverride/jpdfbookmarks.spec

jpackage @jpdfbookmarks.app.jpackage.settings.252 \
 @jpdfbookmarks.linux.jpackage.settings.252  \
 --add-launcher jpdfbookmarks_cli=jpdfbookmarks_cli.linux.launcher.252  \
 --linux-app-release 1 \
 --app-version 2.5.2 \
 --add-modules  java.base,java.datatransfer,java.desktop,java.management,java.naming,java.prefs,java.sql



# CLEAN
rm jpdfbookmarks-2.5.2.tar.gz
yes | rm -R jpdfbookmarks

# INSTALL
# sudo yum localinstall -y jpdfbookmarks-2.5.2-1.x86_64.rpm
echo "INSTALL COMMMAND:"
echo "sudo yum localinstall -y jpdfbookmarks-2.5.2-1.x86_64.rpm"
# UNINSTALL
#sudo yum remove -y jpdfbookmarks
echo "UNINSTALL COMMMAND:"
echo "sudo yum remove -y jpdfbookmarks"
