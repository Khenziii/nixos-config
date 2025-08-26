#!/bin/sh

STATION_TYPE_PATH="/home/$SUDO_USER/scripts/rebuild-args/station-type"

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

select_config() {
    # This could be usually done with recursion (invoking `select_config` again when choice is invalid),
    # but from what I've read it's usually better to use loops for this kind of things in `bash` and `sh`. 
    while true; do
    	echo "Please select appropiate config type:"
    
    	echo ""
    
    	echo "1. desktop"
    	echo "2. laptop"
    
    	echo ""
    
        echo "This decision will impact: disabling or enabling swap, installing dedicated GPU drivers, etc."
    
        echo ""
    
        echo "It can be changed later in '$STATION_TYPE_PATH'."
    
        echo ""
    
    	read -p "Choice (1/2): " response
    
        if [ "$response" == "1" ]; then
            response="desktop"
            break
        elif [ "$response" == "2" ]; then
            response="laptop"
            break
        else
            echo "Invalid choice, try again.."

            echo ""
        fi
    done

	echo "You chose '$response' config type, proceeding.."
}

agreement=$1
if [ "${agreement^^}" != "Y" ]; then
	startup_warning
fi

check_if_running_unix
check_if_executed_by_root
check_if_installed "git"
check_if_installed "stow"

select_config
mkdir -p "$(dirname $STATION_TYPE_PATH)"
echo $response > $STATION_TYPE_PATH

echo "Running 'git clone'.."

git clone https://github.com/Khenziii/nixos-config || { echo "Failed to run 'git clone', exiting.."; exit; }
cd nixos-config

echo "Creating dotfiles symlinks.."

sudo -u "$SUDO_USER" stow --no-folding --adopt -t "/home/$SUDO_USER" dotfiles 

echo "Creating placeholders.."

# Those files are written to by `nwg-displays`, and imported from hyprland.conf.
# During the installation phase, we create empty placeholders, so that mentioned
# imports don't throw any "File not found" errors.
touch /home/$SUDO_USER/.config/hypr/monitors.conf
touch /home/$SUDO_USER/.config/hypr/workspaces.conf

# Ensure, that `/etc/nixos/hardware-configuration.nix` is present.
echo "Generating NixOS config.."

check_if_running_nixos
sudo nixos-generate-config

echo "Installing NixOS config.."

KHENZII_STATION_TYPE=$(cat $STATION_TYPE_PATH) sudo -E nixos-rebuild switch --flake ".#iusenixosbtw" --impure
KHENZII_STATION_TYPE=$(cat $STATION_TYPE_PATH) home-manager switch --flake ".#khenzii"

echo "Successfully applied the whole config!"

