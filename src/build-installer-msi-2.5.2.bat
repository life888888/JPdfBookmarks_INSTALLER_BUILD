REM Build jpdfbookmarks installer - msi - 2.5.2
curl  -L -o jpdfbookmarks-2.5.2.zip https://sourceforge.net/projects/jpdfbookmarks/files/JPdfBookmarks-2.5.2/jpdfbookmarks-2.5.2.zip/download

jar -xvf  jpdfbookmarks-2.5.2.zip

rename jpdfbookmarks-2.5.2 jpdfbookmarks

del jpdfbookmarks\jpdfbookmarks

del jpdfbookmarks\jpdfbookmarks_cli

del jpdfbookmarks\jpdfbookmarks.exe

del jpdfbookmarks\jpdfbookmarks_cli.exe

del jpdfbookmarks\link_this_in_linux_path.sh

del jpdfbookmarks\link_this_in_linux_path_cli.sh

cd jpdfbookmarks

curl -L -o jpdfbookmarks.ico https://sourceforge.net/p/jpdfbookmarks/code/HEAD/tree/trunk/jpdfbookmarks_core/others/jpdfbookmarks48.ico?format=raw

curl -L -o splash.png https://sourceforge.net/p/jpdfbookmarks/code/HEAD/tree/trunk/jpdfbookmarks_graphics/artwork/splash.png?format=raw

cd ..

jpackage @jpdfbookmarks.app.jpackage.settings ^
 @jpdfbookmarks.windows.jpackage.settings ^
 --add-launcher jpdfbookmarks_cli=jpdfbookmarks_cli.windows.launcher  ^
 --app-version 2.5.2  ^
 --add-modules  java.base,java.datatransfer,java.desktop,java.management,java.naming,java.prefs,java.sql



REM CLEAN
del jpdfbookmarks-2.5.2.zip
rmdir /s /q jpdfbookmarks

REM change install dir C:\TOOLS\jpdfbookmarks

REM setx PATH "C:\TOOLS\jpdfbookmarks;%PATH%"
echo "When you install jpdfbookmarks-2.5.2.msi, "
echo "Please change install dir to C:\TOOLS\jpdfbookmarks (PATH can't contain space char)"
echo "Set environment variable PATH , add install dir (C:\TOOLS\jpdfbookmarks) to PATH environment variable"
echo "execute build-installer-msi-after-install.bat"