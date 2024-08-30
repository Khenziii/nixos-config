{ ... }:

{
  virtualisation.virtualbox = {
    host.enable = true;
    guest = {
      enable = true;
      dragAndDrop = true;
      clipboard = true;
    };
  };
}
