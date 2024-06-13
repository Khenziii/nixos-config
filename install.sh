#!/bin/sh

# In order to suppress this warning, run the script with first parameter set to "y" 
startup_warning () {
	echo "WARNING: This script was created to setup Khenzii's working environment (NixOS configuration + some dotfiles)"

	echo ""

	echo "It will execute those steps in order to do so:"
	echo "1. clone https://github.com/Khenziii/nixos-config [1]"
	echo "2. create symlinks using GNU's stow in order to apply settings"
	echo "3. run some commands to setup applied settings (for example rebuild the system, if NixOS config got applied)"

	echo ""

	echo "[1] Please make sure, that you're running this script in the directory from which you'd like to manage the config. You won't be able to move this folder later, without breaking all of the symlinks."

	echo ""

	read -p "Do you want to proceed? (Y/n): " response

	# `^^` converts the string to uppercase
	if [ "${response^^}" != "Y" ]; then
		echo "Exiting.."
		exit
	fi

	echo "Proceeding.."
}

# Exits, if the script doesn't have necessary permissions
check_if_executed_by_root() {
	if ! [ "$EUID" = "0" ]; then
    	echo "This script needs to be executed with 'sudo', or by the root user. Exiting.."
		exit
	fi
}

# Exits, if $1 is not installed
check_if_installed () {
	if ! which $1 > /dev/null 2>&1; then
		echo "$1 is not installed. Please install it, and rerun the script."
		exit
	fi	
}

# Exits, if not running an Unix based OS 
check_if_running_unix() {
	# This variable will be set to "Darwin" for MacOS and "Linux" for Linux distributions 
	os_name=$(uname -s)

	if ! ([ "$os_name" = "Darwin" ] || [ "$os_name" = "Linux" ]); then
		echo "You're not using an Unix-Like OS. Please stop using Windows (:pray:) and rerun this script, lol."
		exit
	fi
}

# Exits, if not running NixOS 
check_if_running_nixos() {
	if ! cat /etc/os-release | grep -q "NixOS"; then
    	echo "You're not running NixOS, exiting.."
		exit
	fi
}

agreement=$1
if [ "${agreement^^}" != "Y" ]; then
	startup_warning
fi

check_if_running_unix
check_if_executed_by_root
check_if_installed "git"
check_if_installed "stow"

echo "Running 'git clone'.."

git clone https://github.com/Khenziii/nixos-config || { echo "Failed to run 'git clone', exiting.."; exit; }
cd nixos-config

echo "Creating dotfiles symlinks.."

stow --adopt -t "/home/$SUDO_USER" dotfiles 

echo "Generating NixOS config.."

check_if_running_nixos
sudo nixos-generate-config
sudo mv /etc/nixos/hardware-configuration.nix nixos 

echo "Installing NixOS config.."

# This is a hacky workaround. See: https://github.com/Khenziii/nixos-config/issues/1
mv .git .git-old && sudo nixos-rebuild switch --flake ".#nixos"; mv .git-old .git

echo "Successfully applied the whole config!"

