{ ... }:

{
  services.macos-ventura = {
    enable = false;
    openFirewall = true;
    vncListenAddr = "0.0.0.0";
  };
}

