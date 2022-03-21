REM Build jpdfbookmarks installer - msi - pre-setup
REM DOWNLOAD JDK AND INSTALL

REM MANUAL EXECUTE
REM curl -L -o OpenJDK17U-jdk_x64_windows_hotspot_17.0.2_8.msi https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.2%2B8/OpenJDK17U-jdk_x64_windows_hotspot_17.0.2_8.msi
REM pause "please wait download complete!"
REM msiexec /i "penJDK17U-jdk_x64_windows_hotspot_17.0.2_8.msi"

REM DOWNLOAD wix AND INSTALL
mkdir C:\TOOLS
cd C:\TOOLS
curl  -L -o wix311-binaries.zip https://github.com/wixtoolset/wix3/releases/download/wix3112rtm/wix311-binaries.zip

mkdir wix-bin
move wix311-binaries.zip  wix-bin\
cd  wix-bin
jar -xvf wix311-binaries.zip
del wix311-binaries.zip
setx PATH "C:\TOOLS\wix-bin;%PATH%"

