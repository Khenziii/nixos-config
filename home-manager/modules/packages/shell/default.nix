{
	pkgs,
	inputs,
	...
}: let
	shared-config = {
		aliases = {
			rebuild-home = "rebuildhome";
			rebuild-system = "rebuildsystem";
			rebuild = "rebuild-system && rebuild-home";
			trewa = "tree";
			fuck = "thefuck";
			bruh = "thefuck";
			ripgrep = "rg";
			history = "history 1"; # show the whole history
			is-alias = "type";
			# If the bar will ever become unresponsive, you can use this command to restart it.
			fix-eww = "pkill eww && eww daemon && eww open bar";
			# Godot is configured to use an external editor listening on this port.
			nvim = "nvim --listen 127.0.0.1:55432";
			godot = "godot4";
			kill-port = "killport";
			make-bootable-dev = "makebootabledev";
			gdb = "gdb --core=core";
			emacs = "emacs -nw";
			get-nix-path = "getnixpath";
			start-aw = "~/.config/activitywatch/scripts/start-aw.sh";
			kill-aw = "~/.config/activitywatch/scripts/kill-aw.sh";
			startaw = "start-aw";
			killaw = "kill-aw";
			docker-cleanup = "dockercleanup";
			mount-android = "mountandroid";
			umount-android = "umountandroid";
			git-ssh-remote = "gitsshremote";
		};
		init-extra = ''
			killport() {
				if [ -z "$1" ]; then
			    	echo "Usage: killport <port>"
					return 1
  				fi
  				kill $(lsof -t -i :"$1")
			}

			makebootabledev() {
				if [[ -z "$1" || -z "$2" ]]; then
					echo "Usage: makebootabledev <path-to-iso-file> <path-to-dev>"
					return 1
				fi

				input_file="$1"
				dev="$2"

				sudo umount $dev
				sudo dd if=$input_file of=$dev bs=4M status=progress
				sync
				sudo eject $dev
			}

			rebuildhome() {
				KHENZII_STATION_TYPE=$(cat ~/scripts/rebuild-args/station-type)
  				home-manager switch --flake '.#${inputs.username}' -b backup
			}

			rebuildsystem() {
				KHENZII_STATION_TYPE=$(cat ~/scripts/rebuild-args/station-type)
				sudo KHENZII_STATION_TYPE="$KHENZII_STATION_TYPE" nixos-rebuild switch --flake '.#${inputs.hostname}' --impure
			}

			getnixpath() {
				if [ -z "$1" ]; then
					echo "Usage: getnixpath <nix-package>"
					return 1
				fi

				NIXPKGS_ALLOW_UNFREE=1 nix-build '<nixpkgs>' --attr $1 && rm result
			}

			dockercleanup() {
				docker container prune -f
				docker image prune -f
			}

			mountandroid() {
				if [ -z "$1" ]; then
					echo "Usage: mountandroid <mount point>"
					return 1
				fi

				sudo jmtpfs $1
			}

			umountandroid() {
				if [ -z "$1" ]; then
					echo "Usage: umountandroid <mount point>"
					return 1
				fi

				sudo fusermount -u $1
			}

			# Converts git remote of the current repo to SSH.
			gitsshremote() {
				REMOTE_HTTPS_URL=$(git remote get-url origin)

				if [[ $REMOTE_HTTPS_URL != https://* ]]; then
					echo "Origin remote is not HTTPS, nothing to do."
					return 1
				fi

				REMOTE_HOST=$(echo "$REMOTE_HTTPS_URL" | sed -E 's|https://([^/]+)/(.+)|\1|')
				REMOTE_PATH=$(echo "$REMOTE_HTTPS_URL" | sed -E 's|https://([^/]+)/(.+)|\2|')

				REMOTE_PATH_WITHOUT_SUFFIX=$(echo "$REMOTE_PATH" | sed 's/\.git$//')

				REMOTE_SSH_URL="git@$REMOTE_HOST:$REMOTE_PATH_WITHOUT_SUFFIX.git"

				git remote set-url origin "$REMOTE_SSH_URL"

				echo "Origin remote changed to SSH:"
				git remote -v
			}
		'';
	};

	zsh-config =
		import ./zsh.nix {
			inherit shared-config;
			inherit pkgs;
		};
	bash-config = import ./bash.nix {inherit shared-config;};
in {
	imports = [
		zsh-config
		bash-config
	];
}
