{ pkgs, ... }: let
    guess-the-number-asm = pkgs.callPackage ./guess-the-number-asm.nix {};
in 

{
  imports = [
    ./brightnessctl.nix
    ./btop.nix
    ./cava.nix
    ./delta.nix
    ./ffmpeg.nix
    ./fzf.nix
    ./imv.nix
    ./libnotify.nix
    ./neofetch.nix
    ./neovim.nix
    ./peaclock.nix
    ./ripgrep.nix
    ./spicetify-cli.nix
    ./thefuck.nix
    ./tmux.nix
    ./tree.nix
    ./wget.nix
    ./wl-clipboard.nix
    ./imgcat.nix
    ./nmap.nix
    ./openssl.nix
    ./gitleaks.nix
    ./whois.nix
    ./unzip.nix
    ./git-lfs.nix
    ./hashcat.nix
    ./wine.nix
    ./nix-init.nix
    ./speedtest-cli.nix
    ./xhost.nix
    ./kittysay.nix
    ./cowsay.nix
    ./cmatrix.nix
    ./cbonsai.nix
    ./pkg-config.nix
    ./ani-cli.nix
    ./dig.nix
    ./cloc.nix
    ./yt-dlp.nix
    ./unar.nix
    ./onefetch.nix
    ./zip.nix
    ./cpulimit.nix
    ./svgo.nix
    ./lsof.nix
    ./websocat.nix
    ./minio-client.nix
    ./jq.nix
    ./exiftool.nix
	./sqlite-web.nix
	./emacs.nix
	./rocm-smi.nix
	./sysbench.nix
	./alsa-utils.nix
	./mongodb-tools.nix
  ];

  home.packages = [
    guess-the-number-asm
  ];
}

