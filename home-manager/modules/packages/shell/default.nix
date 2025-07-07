{ pkgs, inputs, ... }: let
  shared-config = {
    aliases = {
      rebuild = "rebuild-system && rebuild-home";
      rebuild-home = "home-manager switch --flake '.#${inputs.username}' -b backup";
      rebuild-system = "sudo nixos-rebuild switch --flake '.#${inputs.hostname}' --impure";
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
    '';
  };
  
  zsh-config = import ./zsh.nix { inherit shared-config; inherit pkgs; };
  bash-config = import ./bash.nix { inherit shared-config; };
in 

{
  imports = [
    zsh-config
    bash-config
  ];
}

