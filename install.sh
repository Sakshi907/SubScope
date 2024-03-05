


cat <<"EOF"

  _________    ___.      _________              _____
 /   _____/__ _\_ |__   /   _____/       ____  |  __ \
 \_____  \|  |  \ __ \  \_____  \_____  /  _ \ | |__) |___
 /        \  |  / \_\ \ /        \  __\(  <_> )|  ___/ __ \
/_______  /____/|___  //_______  / (__  \____/ | |  |  ___/
        \/          \/         \/_____/        |_|   \____|

        Automated Subdomain Gathering Tool
    Developed By Sakshi Rathore & Surbhi Malakar
                  Minor Project

         _           _        _ _ 
        (_)_ __  ___| |_ __ _| | |
        | | '_ \/ __| __/ _` | | |
        | | | | \__ \ || (_| | | |
        |_|_| |_|___/\__\__,_|_|_|

EOF


section() {
  printf "\n\n\e[92m=============================================\e[0m"
  printf "\n\n\e[92m%s\e[0m" "$1"
  printf "\n\n\e[92m=============================================\e[0m\n\n"
}


mkdir -p Tools
cd Tools || { echo "Error: Unable to change to Tools directory."; exit 1; }


section "Updating Repos"
sudo apt update


section "Installing Git"
sudo apt -y install git


section "Installing Python3"
sudo apt -y install python3


section "Installing PIP3"
sudo apt -y install python3-pip


section "Installing Python2"
sudo apt -y install python2


section "Installing Golang"
sudo apt -y install golang
HOME_DIR=$(eval echo ~$USER)
export PATH=$PATH:/$HOME_DIR/go/bin

section "Installing Additional Packages"
sudo apt -y install libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev build-essential libssl-dev libffi-dev python-dev libldns-dev jq ruby-full python3-setuptools python3-dnspython rename findutils


section "Sublist3r Installing"
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r/ || { echo "Error: Unable to change to Sublist3r directory."; exit 1; }
pip3 install -r requirements.txt
cd ../ || { echo "Error: Unable to return to the parent directory."; exit 1; }


section "Subfinder Installing"
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest


section "Installing amass"
go install -v github.com/owasp-amass/amass/v4/...@master


section "Github-Search Installing"
git clone https://github.com/gwen001/github-search.git


section "httpx installing"
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest


section "Knockpy Installing"
git clone https://github.com/guelfoweb/knock.git
cd knock || { echo "Error: Unable to change to knock directory."; exit 1; }
sudo python3 setup.py install
cd ../ || { echo "Error: Unable to return to the parent directory.";
