{ inputs, ... }:

{
  home = {
    username = inputs.username;
    homeDirectory = "/home/${inputs.username}";
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}

