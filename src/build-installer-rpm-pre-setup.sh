# Build jpdfbookmarks installer - rpm - pre-setup
sudo yum update -y

# INSTALL Development Tools
# VERY IMPORTANT!!! MUST INSTALL THIS!!!
sudo yum groupinstall 'Development Tools'

# INSTALL SDKMAN
sudo yum install zip unzip -y
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

# INSTALL JDK 17
sdk install java 17.0.2-tem 

