{ shared-config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
	syntaxHighlighting = {
      enable = true;
      catppuccin.enable = true;
    };
	shellAliases = shared-config.aliases;
    autosuggestion.enable = true;
    enableCompletion = true;
    defaultKeymap = "viins";
    history = {
      extended = true;
      ignoreDups = false;
      save = 1000000;
      size = 1000000;
      share = true;
    };
    plugins = [{
      name = "zsh-nix-shell";
      file = "nix-shell.plugin.zsh";
      src = pkgs.fetchFromGitHub {
        owner = "chisui";
        repo = "zsh-nix-shell";
        rev = "v0.8.0";
        sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
      };
    }];
    initExtra = ''
      # Prompt
      PS1='%F{#cba6f7}%n%F{#b4befe}@%F{#cba6f7}%m %F{#b4befe}%~ %F{#a6e3a1}$ '

      # Bind "'j" to exiting insert mode
      bindkey -M viins "'j" vi-cmd-mode
      # Bind "'a" to accepting autosuggestion
      bindkey "'a" autosuggest-accept

      # Auto-run `nix-shell` if `shell.nix` is available after a directory change
      function auto_nix_shell {
        if [[ -f ./shell.nix ]]; then
            echo '"shell.nix" spotted, running `nix-shell`..'
            nix-shell
        fi
      }

      chpwd_functions+=("auto_nix_shell")

      # Below code was grabbed from:
      # https://gist.github.com/LukeSmithxyz/e62f26e55ea8b0ed41a65912fbebbe52
      # Change cursor shape for different vi modes.
      function zle-keymap-select {
        if [[ $KEYMAP == vicmd ]] ||
          [[ $1 = 'block' ]]; then
          echo -ne '\e[1 q'
        elif [[ $KEYMAP == main ]] ||
          [[ $KEYMAP == viins ]] ||
          [[ $KEYMAP = "" ]] ||
          [[ $1 = "beam" ]]; then
          echo -ne "\e[5 q"
        fi
      }
      zle -N zle-keymap-select
      zle-line-init() {
        echo -ne "\e[5 q"
      }
      zle -N zle-line-init
      echo -ne '\e[5 q' # Use beam shape cursor on startup.
      preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.
    '';
  };
}

