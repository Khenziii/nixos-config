{ ... }:

{
  virtualisation.virtualbox = {
    host = {
      enable = true;
      enableKvm = true;
      addNetworkInterface = false;
    };
    guest = {
      enable = true;
      dragAndDrop = true;
      clipboard = true;
    };
  };
}
