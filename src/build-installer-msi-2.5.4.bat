REM Build jpdfbookmarks installer - msi - 2.5.4
curl  -L -o jpdfbookmarks-2.5.4.zip https://github.com/life888888/JPdfBookmarks/releases/download/v2.5.4/jpdfbookmarks-2.5.4.zip

jar -xvf  jpdfbookmarks-2.5.4.zip

rename jpdfbookmarks-2.5.4 jpdfbookmarks

del jpdfbookmarks\jpdfbookmarks

del jpdfbookmarks\jpdfbookmarks_cli

del jpdfbookmarks\jpdfbookmarks.exe

del jpdfbookmarks\jpdfbookmarks_cli.exe

del jpdfbookmarks\jpdfbookmarks.l4j.ini

del jpdfbookmarks\jpdfbookmarks_cli.l4j.ini

del jpdfbookmarks\link_this_in_linux_path.sh

del jpdfbookmarks\link_this_in_linux_path_cli.sh

cd jpdfbookmarks

curl  -L -o jpdfbookmarks.ico  https://github.com/life888888/JPdfBookmarks/raw/main/jpdfbookmarks_core/src/main/images/jpdfbookmarks.ico

curl  -L -o splash.png https://github.com/life888888/JPdfBookmarks/raw/main/jpdfbookmarks_core/src/main/resources/it/flavianopetrocchi/jpdfbookmarks/splash.png

cd ..

jpackage @jpdfbookmarks.app.jpackage.settings ^
 @jpdfbookmarks.windows.jpackage.settings ^
 --add-launcher jpdfbookmarks_cli=jpdfbookmarks_cli.windows.launcher  ^
 --app-version 2.5.4  ^
 --add-modules   java.base,java.datatransfer,java.desktop,java.management,java.naming,java.prefs,java.sql


REM CLEAN
del jpdfbookmarks-2.5.4.zip
rmdir /s /q jpdfbookmarks


REM change install dir C:\TOOLS\jpdfbookmarks

REM setx PATH "C:\TOOLS\jpdfbookmarks;%PATH%"

echo "When you install jpdfbookmarks-2.5.4.msi, "
echo "Please change install dir to C:\TOOLS\jpdfbookmarks (PATH can't contain space char)"
echo "Set environment variable PATH , add install dir (C:\TOOLS\jpdfbookmarks) to PATH environment variable"
echo "execute build-installer-msi-after-install.bat"