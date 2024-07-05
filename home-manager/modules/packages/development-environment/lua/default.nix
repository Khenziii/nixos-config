{ ... }:

{
  imports = [
    # ./lua-language-server.nix | every LSP
    # is now managed through nvim config.
    ./luajit.nix
    ./luaformatter.nix
  ];
}

