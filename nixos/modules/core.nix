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
  boot.kernel.sysctl = {
    "vm.swappiness" = 80;
    "kernel.core_uses_pid" = 0;
    "kernel.core_pattern" = "./core";
  };

  # Allow access to all hidraw devices. This is necessary for
  # keyboard configuration via apps such as VIA. See:
  # https://bbs.archlinux.org/viewtopic.php?id=285709
  services.udev.extraRules = ''
    SUBSYSTEM=="hidraw", MODE="0660", GROUP="input"
  '';
}

