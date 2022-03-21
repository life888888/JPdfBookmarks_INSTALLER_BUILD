# Build jpdfbookmarks installer - deb - pre-setup
sudo apt update -y

# INSTALL SDKMAN
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

# INSTALL JDK 17
sdk install java 17.0.2-tem

