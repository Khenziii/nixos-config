{ pkgs, inputs, ... }:

{
  programs.firefox = {
    enable = true;
	profiles.khenzii = {
	  name = "Khenzii";
	  isDefault = true;
      # a list of extensions can be found here:
      # https://gitlab.com/rycee/nur-expressions/-/blob/master/pkgs/firefox-addons/addons.json
      extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
        bitwarden
		duckduckgo-privacy-essentials
		return-youtube-dislikes
	    stylus
		firefox-color
		violentmonkey
		react-devtools
        darkreader
	  ];
	  settings = {
	    "extensions.autoDisableScopes" = 0; # auto enable extensions
        "privacy.trackingprotection.enabled" = true;
        "signon.rememberSignons" = false;
	  };
	  search = {
	    default = "DuckDuckGo";
	    privateDefault = "DuckDuckGo";
	  };
	};
	policies = {
	  BlockAboutConfig = false;
	  Bookmarks = false;
	};
  };
}

