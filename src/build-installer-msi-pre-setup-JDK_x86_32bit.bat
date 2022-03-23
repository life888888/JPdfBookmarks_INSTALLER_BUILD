REM Build jpdfbookmarks installer - msi - pre-setup-JDK_x86_32bit
@echo off

IF EXIST "OpenJDK17U-jdk_x86-32_windows_hotspot_17.0.2_8.msi" (
    echo SKIP DOWNLOAD JDK - OpenJDK17U-jdk_x86-32_windows_hotspot_17.0.2_8.msi
	goto JDK_FILE_READY
) ELSE (
    echo DOWNLOAD JDK NOW...
	goto DOWNLOAD_JDK
)

:DOWNLOAD_JDK
REM DOWNLOAD JDK
REM x86 - 32bit
curl -L -o OpenJDK17U-jdk_x86-32_windows_hotspot_17.0.2_8.msi  "https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.2%%2B8/OpenJDK17U-jdk_x86-32_windows_hotspot_17.0.2_8.msi"

:JDK_FILE_READY
REM AUTO INSTALL JDK
REM x86 - 32bit
msiexec /i OpenJDK17U-jdk_x86-32_windows_hotspot_17.0.2_8.msi ADDLOCAL=FeatureEnvironment,FeatureJarFileRunWith,FeatureJavaHome,FeatureOracleJavaSoft /qb

PAUSE "PATH ENVIRONMENT WILL WORKED UNTIL YOU CLOSE THIS CONSOLE/TERMINAL"
exit
