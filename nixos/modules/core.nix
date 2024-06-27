{ ... }:

{
  nix.settings.experimental-features = [
    "nix-command" 
    "flakes"
  ];

  # This probably shouldn't be changed. Please,
  # read the wiki before modifying this.
  system.stateVersion = "23.11";

  # Create a 8GB swap file
  swapDevices = [{
    device = "/swapfile";
    size = 1024 * 8; # Size is in MB
  }];
}

