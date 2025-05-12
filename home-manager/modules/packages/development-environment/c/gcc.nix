{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # See: https://github.com/nix-community/home-manager/issues/1668#issuecomment-1264298055 
    # for an explanation of why we're using high priority here.
    (hiPrio gcc)
  ];
}

