{ ... }:

{
  imports = [
    ./hardware-configuration.nix
	../shared/shared.nix
  ];

  # Shell
  programs.bash = {
    shellAliases = {
      rebuild = "rebuild-home && rebuild-system";
      rebuild-home = "mv .git .git-old && home-manager switch --flake '.#khenzii'; mv .git-old .git";
      rebuild-system = "mv .git .git-old && sudo nixos-rebuild switch --flake '.#nixos'; mv .git-old .git";
    };
  };
}
