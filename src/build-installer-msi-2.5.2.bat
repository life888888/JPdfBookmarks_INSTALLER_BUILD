REM Build jpdfbookmarks installer - msi - 2.5.2
@echo off

REM CHECK WiX TOOLSETS IS INSTALL AND SETTING OK ?
WHERE light
IF %ERRORLEVEL% NEQ 0 (
    ECHO light command wasn't found, please check WiX Toolsets Install is finish?
	goto WiX_NOT_READY
) ELSE (
    REM ECHO light command is ready. Process next step...
	goto WiX_READY
)

:WiX_NOT_READY
ECHO Please run build-installer-msi-pre-setup-WiX.bat
PAUSE
EXIT 1

:WiX_READY
REM DO NOTHING

REM CHECK JDK IS INSTALL AND SETTING OK ?
WHERE jar
IF %ERRORLEVEL% NEQ 0 (
    ECHO jar command wasn't found, please check JDK Install is finish?
	goto JDK_NOT_READY
) ELSE (
    REM ECHO jar command is ready. Process next step...
	goto JDK_READY
)

:JDK_NOT_READY
ECHO Please run build-installer-msi-pre-setup-JDK.bat
PAUSE
EXIT 2

:JDK_READY
REM DO NOTHING

REM CHECK JPACKAGE IS INSTALL AND SETTING OK ?
WHERE jpackage
IF %ERRORLEVEL% NEQ 0 (
    ECHO jpackage command wasn't found, please check JDK 14+ Install is finish?
	goto JPACKAGE_NOT_READY
) ELSE (
    REM ECHO jar command is ready. Process next step...
	goto JPACKAGE_READY
)

:JPACKAGE_NOT_READY
ECHO Please run build-installer-msi-pre-setup-JDK.bat
PAUSE
EXIT 3

:JPACKAGE_READY
REM DO NOTHING

IF EXIST "jpdfbookmarks-2.5.2.zip" (
    echo SKIP DOWNLOAD jpdfbookmarks-2.5.2.zip
	goto JPDFBOOKMARKS_FILE_READY
) ELSE (
    echo DOWNLOAD JPDFBOOKMARKS NOW...
	goto DOWNLOAD_JPDFBOOKMARKS
)

:DOWNLOAD_JPDFBOOKMARKS
curl  -L -o jpdfbookmarks-2.5.2.zip https://sourceforge.net/projects/jpdfbookmarks/files/JPdfBookmarks-2.5.2/jpdfbookmarks-2.5.2.zip/download

:JPDFBOOKMARKS_FILE_READY
jar -xvf  jpdfbookmarks-2.5.2.zip

REM CHECK UNZIP IS OK ?
IF %ERRORLEVEL% NEQ 0 (
    ECHO UNZIP  jpdfbookmarks-2.5.2.zip IS FAIL ! 
	goto JPDFBOOKMARKS_FILE_NOT_READY
) ELSE (
    REM ECHO jar command is ready. Process next step...
	goto JPDFBOOKMARKS_FILE_UNZIP_READY
)

:JPDFBOOKMARKS_FILE_NOT_READY
ECHO 1.PLEASE DELETE jpdfbookmarks-2.5.2.zip
ECHO 2.RUN build-installer-msi-2.5.2.bat again
PAUSE
EXIT 4

:JPDFBOOKMARKS_FILE_UNZIP_READY

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

@echo on

jpackage @jpdfbookmarks.app.jpackage.settings ^
 @jpdfbookmarks.windows.jpackage.settings ^
 --add-launcher jpdfbookmarks_cli=jpdfbookmarks_cli.windows.launcher  ^
 --app-version 2.5.2  ^
 --add-modules java.base,java.datatransfer,java.desktop,java.management,java.naming,java.prefs,java.sql

@echo off

REM CLEAN
REM del jpdfbookmarks-2.5.2.zip
rmdir /s /q jpdfbookmarks
