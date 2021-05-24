
# Bootstrap your Ubuntu 6502 Dev Environment

## What does it do?
This script installs the following on your Ubuntu OS:
* Google Chrome
* Python3
* Ansible
* Zsh, OhMyZsh and a couple of plugins
* Vim + minor customisations
* Vice C64 Emulator
* CC65 6502 Assembler
* ACME 6502 Assembler
* C64 Debugger
* Visual Studio Code
* Some 6502 related VSCode extensions
* Sample 6502 tutorials


## What Ubuntu distributions does this work with?
I have tested it with the 20.04 editions of Ubuntu Mate, Pop!OS and Kubuntu.

## Getting Started
### Enable passwordless sudo
Launch `visudo`

    sudo visudo

Add this line at the end of  the section that reads `# Allow members of group sudo to execute any command`

    <your_username>  ALL=(ALL) NOPASSWD:ALL

For example:

    rob  ALL=(ALL) NOPASSWD:ALL

### Install git
    sudo apt install -y git 

### Clone this repo
    git clone https://github.com/rodoherty1/bootstrap-my-6502-dev-env

### Run the setup script
The `setup.sh` script will create an SSH key.  Note that this part of the setup will ask for your password in order to create it.

    cd bootstrap-my-linux-laptop
    ./setup.sh

### Reboot
    sudo reboot

### Run the Ansible playbook
    ansible-playbook -u $USER site.yml --extra-vars=password=<your_password>
