
# Bootstrap my Ubuntu 6502 Development Environment

## What is it?
This is how I quickly set up an Ubuntu 20.04 environment with many of the tools necessary to do some 6502 assembly development.

The is a [setup.sh](setup.sh) script and two [Ansible](https://www.ansible.com/) playbooks.

The `setup.sh` script does the following:
* Enables ssh
* Creates an ssh key
* Installs ansible
* Installs python3

You then run launch the `site.yml` ansible playbook (details below) which will install:
* Commander X16 Emulator
* Vice C64 Emulator
* CC65 6502 Assembler
* C64 Debugger
* Visual Studio Code
* Some 6502 related VSCode extensions
* Sample 6502 tutorials
* Google Chrome
* Vim + minor customisations

You may optionally launch the `zsh` ansible playbook (details below) to install:
* Zsh, OhMyZsh and a couple of plugins

## What Ubuntu distributions does this work with?
I have successfully tested it with the 20.04 editions of Ubuntu Mate, Pop!OS and Kubuntu.

Elementary OS 5.1 does not work.

## Getting started
### Enable passwordless sudo

Launch `visudo` as follows:
* Launch a terminal
* Type `sudo visudo`
* Add this line at the end of  the section that reads `# Allow members of group sudo to execute any command`

      <your_username>  ALL=(ALL) NOPASSWD:ALL

  For example:
  
      rob  ALL=(ALL) NOPASSWD:ALL

* Type Ctrl+O to save.
* Set the filename to `sudoers`, hit return and click Ctrl+X to exit.
* Then close your terminal and relaunch it so that you now have passwordless sudo enabled.

### Install git
    sudo apt install -y git 

### Clone this repo
    git clone https://github.com/rodoherty1/bootstrap-my-6502-dev-env

### Run the setup script
The `setup.sh` script will create an SSH key.  Note that this part of the setup will ask for your password in order to create it.

    cd bootstrap-my-6502-dev-env
    ./setup.sh

### Run the `site.yml` Ansible playbook
This playbook installs all 6520 assembly dev applications and plugins.

    ansible-playbook -u $USER site.yml

### (Optional) Run the `zsh.yml` Ansible playbook
This playbook replaces the bash terminal with zsh and oh-my-zsh.

    ansible-playbook -u $USER zsh.yml --extra-vars=password=<your_password>
