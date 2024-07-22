{ inputs, pkgs, ... }:
let
  spicetify-pkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in
{
  programs.spicetify = {
    enable = true;
    theme = spicetify-pkgs.themes.catppuccin;
    colorScheme = "mocha";
    enabledExtensions = with spicetify-pkgs.extensions; [
      keyboardShortcut
	  loopyLoop
	  trashbin
	  groupSession
	  playlistIcons
	  fullAlbumDate
	  goToSong
	  listPlaylistsWithSong
	  playlistIntersection
	  skipStats
	  wikify
	  songStats
	  autoVolume
	  showQueueDuration
	  copyToClipboard
	  history
	  # genre
	  adblock
	  savePlaylists
	  autoSkip
	  playNext
	  volumePercentage
	];
  };
}

