# Build jpdfbookmarks installer - deb - 3.0.2
wget https://github.com/life888888/JPdfBookmarks/releases/download/v3.0.2-r1-snapshot/jpdfbookmarks-3.0.2-SNAPSHOT.tar.gz

tar -xvzf jpdfbookmarks-3.0.2-SNAPSHOT.tar.gz

mv jpdfbookmarks-3.0.2-SNAPSHOT jpdfbookmarks

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
 --linux-app-release snapshot-1 \
 --linux-deb-maintainer "Flaviano Petrocchi<flavianopetrocchi@gmail.com>" \
 --app-version 3.0.2 \
 --add-modules  java.base,java.datatransfer,java.desktop,java.logging,java.management,java.naming,java.prefs,java.sql,java.xml
 


# CLEAN
rm jpdfbookmarks-3.0.2-SNAPSHOT.tar.gz
yes | rm -R jpdfbookmarks

# INSTALL
# sudo dpkg -i jpdfbookmarks_3.0.2-snapshot-1_amd64.deb
echo "INSTALL COMMMAND:"
echo "sudo dpkg -i jpdfbookmarks_3.0.2-snapshot-1_amd64.deb"
# UNINSTALL
# sudo apt remove -y jpdfbookmarks
echo "UNINSTALL COMMMAND:"
echo "sudo apt remove -y jpdfbookmarks"
