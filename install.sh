#!/bin/bash

function install_6502_dev_env() {
  cd 6502
  ./install-6502-dev-env.sh
  cd ../
}

function install_zsh() {
  cd zsh
  ./install-zsh.sh
  cd ../
}

function bootstrap() {
  cd bootstrap
  ./bootstrap.sh
  cd ../
}

function install_all() {
  bootstrap
  install_6502_dev_env
  install_zsh
}

##
# Color  Variables
##
green='\e[32m'
blue='\e[34m'
clear='\e[0m'

##
# Color Functions
##

ColorGreen(){
  echo -ne $green$1$clear
}
ColorBlue(){
  echo -ne $blue$1$clear
}

menu(){
echo -ne "
My First Menu
$(ColorGreen '1)') Bootstrap environment
$(ColorGreen '2)') Install all
$(ColorGreen '3)') Install 6502 Assembly Development Environment
$(ColorGreen '4)') Install ZSH and Oh-my-zshell
$(ColorGreen '0)') Exit
$(ColorBlue 'Choose an option:') "
        read a
        case $a in
	        1) bootstrap ; menu ;;
	        2) install_all ; menu ;;
	        3) install_6502_dev_env ; menu ;;
	        4) install_zsh ; menu ;;
		      0) exit 0 ;;
		*) echo -e $red"Unsupported option: "$clear; WrongCommand;;
        esac
}

# Call the menu function
menu
