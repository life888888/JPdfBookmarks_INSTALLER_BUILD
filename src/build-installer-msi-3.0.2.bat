REM Build jpdfbookmarks installer - msi - 3.0.2
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

IF EXIST "jpdfbookmarks-3.0.2-SNAPSHOT.zip" (
    echo SKIP DOWNLOAD jpdfbookmarks-3.0.2-SNAPSHOT.zip
	goto JPDFBOOKMARKS_FILE_READY
) ELSE (
    echo DOWNLOAD JPDFBOOKMARKS NOW...
	goto DOWNLOAD_JPDFBOOKMARKS
)

:DOWNLOAD_JPDFBOOKMARKS
curl  -L -o jpdfbookmarks-3.0.2-SNAPSHOT.zip  https://github.com/life888888/JPdfBookmarks/releases/download/v3.0.2-r1-snapshot/jpdfbookmarks-3.0.2-SNAPSHOT.zip

:JPDFBOOKMARKS_FILE_READY
jar -xvf  jpdfbookmarks-3.0.2-SNAPSHOT.zip

REM CHECK UNZIP IS OK ?
IF %ERRORLEVEL% NEQ 0 (
    ECHO UNZIP jpdfbookmarks-3.0.2-SNAPSHOT.zip IS FAIL ! 
	goto JPDFBOOKMARKS_FILE_NOT_READY
) ELSE (
    REM ECHO jar command is ready. Process next step...
	goto JPDFBOOKMARKS_FILE_UNZIP_READY
)

:JPDFBOOKMARKS_FILE_NOT_READY
ECHO 1.PLEASE DELETE jpdfbookmarks-3.0.2-SNAPSHOT.zip
ECHO 2.RUN build-installer-msi-3.0.2.bat again
PAUSE
EXIT 4

:JPDFBOOKMARKS_FILE_UNZIP_READY

rename jpdfbookmarks-3.0.2-SNAPSHOT jpdfbookmarks

copy add-jpdfbookmarks-PATH.ps1 jpdfbookmarks\
copy setup-jpasbookmarks-PATH.bat jpdfbookmarks\

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

@echo on

jpackage @jpdfbookmarks.app.jpackage.settings ^
 @jpdfbookmarks.windows.jpackage.settings ^
 --add-launcher jpdfbookmarks_cli=jpdfbookmarks_cli.windows.launcher  ^
 --app-version 3.0.2 ^
 --add-modules java.base,java.datatransfer,java.desktop,java.logging,java.management,java.naming,java.prefs,java.sql,java.xml

@echo off

REM CLEAN
REM del jpdfbookmarks-3.0.2-SNAPSHOT.zip
rmdir /s /q jpdfbookmarks

