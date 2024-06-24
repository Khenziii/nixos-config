{ pkgs, inputs, ... }:

{
  programs.firefox = {
    enable = true;
	profiles.khenzii = {
	  name = "Khenzii";
	  isDefault = true;
      extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
        bitwarden
		duckduckgo-privacy-essentials
		return-youtube-dislikes
	    stylus
		firefox-color
		violentmonkey
		react-devtools
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

