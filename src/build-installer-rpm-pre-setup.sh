# Build jpdfbookmarks installer - rpm - pre-setup
sudo yum update -y

# INSTALL RPM Development Tools
# VERY IMPORTANT!!! MUST INSTALL THIS!!!
sudo yum groupinstall 'RPM Development Tools'


# INSTALL SDKMAN
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

# INSTALL JDK 17
sdk install java 17.0.2-tem 

