REM Build jpdfbookmarks installer - msi - pre-setup-WiX
REM DOWNLOAD wix AND INSTALL
@echo off
set BASE1=%CD%

jar --version >nul 2>&1 && (
    echo found jar
) || (
    echo FAIL - jar command not found
    echo 1. Please Check JDK is already install ?
    echo Please run build-installer-msi-pre-setup-JDK.bat to install JDK first.
    REM echo Please run build-installer-msi-pre-setup-JDK_x86_32bit.bat to install JDK first.
    echo 2. Or Close exit this console/terminal
    echo Open New console/terminal
    echo Rerun build-installer-msi-pre-setup-WiX.bat again
    pause "exit now"
    exit 1
)

mkdir C:\TOOLS
mkdir C:\TOOLS\wix-bin
copy setupPATH.bat C:\TOOLS\wix-bin\
copy addPATH.ps1 C:\TOOLS\wix-bin\


cd C:\TOOLS\wix-bin
curl -L -o wix311-binaries.zip https://github.com/wixtoolset/wix3/releases/download/wix3112rtm/wix311-binaries.zip

jar -xvf wix311-binaries.zip



cd C:\TOOLS\wix-bin
CALL setupPATH.bat

del wix311-binaries.zip

del setupPATH.bat
del addPATH.ps1

PAUSE "PATH ENVIRONMENT WILL WORKED UNTIL YOU CLOSE THIS CONSOLE/TERMINAL"

cd %BASE1%
