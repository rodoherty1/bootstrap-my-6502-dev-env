
# Bootstrap my Ubuntu 6502 Development Environment

## What is it?
This is how I quickly set up an Ubuntu 20.04 environment with many of the tools necessary to do some 6502 assembly development.

The is a [install.sh](setup.sh) script and three [Ansible](https://www.ansible.com/) playbooks.

The `install.sh` script provides a menu where you may choose to run one or all of the ansible playbooks.

The three playbooks are:
* Bootstrap the Ubuntu OS installation with some pre-requisite packages and configuration.
* Install the 6502-assembly develoment environment
* Install ZSH terminal and Oh-my-zshell extension

### What is the Bootstrap ansible-playbook

The **Bootstrap** playboook does the following:
* Enables ssh
* Creates an ssh key
* Installs ansible
* Installs python3

The **6502 Development Environment** playbook installs the following:
* Commander X16 Emulator
* Vice C64 Emulator
* CC65 6502 Assembler
* C64 Debugger
* VSCode with 6502 language plugins
* Atom editor with 6502 language support
* Sample 6502 tutorials
* Google Chrome
* Vim + minor customisations

The **ZSH** playbook installs:
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
* Set the filename to `sudoers`, hit return and, select Y to overwrite `/etc/sudoers` and Ctrl+X to exit.
* Then close your terminal and relaunch it so that you now have passwordless sudo enabled.

### Install git
    sudo apt install -y git 

### Clone this repo
    git clone https://github.com/rodoherty1/bootstrap-my-6502-dev-env

### Run the install script
The `install.sh` script will present the following menu:

    Bootstrap my 6502-assembly development environment
    1) Bootstrap environment
    2) Install all
    3) Install 6502 Assembly Development Environment
    4) Install ZSH and Oh-my-zshell
    0) Exit

####  Option 1: Bootstrap 
The Bootstrap option is described above.

Note that as part of the setup, you will be asked for your password in order to create and add the new ssh key.

#### Option 2: Install all.
This will run the Bootstrap, 6502 and ZSH ansible playbooks.

#### Option 3: Install 6502
This playbook installs all 6520 assembly dev applications and plugins.
Note that tasks such as "Compile and Install Vice" and "Compile and Install CA65" can take a few minutes to complete.

#### Option 4: Install ZSH
This playbook replaces the bash terminal with zsh and oh-my-zsh.
Note that you will have to log out and log back in again for this step to take effect.
Also note that you will be asked for your password at the start of this playbook as it is required to switch the current terminal to ZSH.
