{ ... }:

{
  nix.settings.experimental-features = [
    "nix-command" 
    "flakes"
  ];

  # This probably shouldn't be changed. Please,
  # read the wiki before modifying this.
  system.stateVersion = "23.11";
}

