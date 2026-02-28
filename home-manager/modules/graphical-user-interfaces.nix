{pkgs, ...}: {
	gtk = {
		enable = true;
		# See: https://github.com/catppuccin/gtk/issues/262
		# What a shame ;(
		# catppuccin = {
		#   enable = true;
		#   icon.enable = true;
		# };
		theme = {
			name = "Fluent-Dark";
			package = pkgs.fluent-gtk-theme;
		};
	};

	fonts.fontconfig.enable = true;

	xdg.desktopEntries = {
		firefox = {
			name = "FireFox";
			genericName = "Web Browser 🦊";
			exec = "firefox --name firefox %U";
			icon = "firefox";
		};
		"org.gnome.Epiphany" = {
			name = "Epiphany";
			genericName = "GNOME's Web Browser. Uses port of WebKit as it's rendering engine, making it similar to Safari";
			exec = "epiphany %U";
			icon = "org.gnome.Epiphany";
		};
		"aw-qt" = {
			name = "ActivityWatch";
			genericName = "Time-tracking application";
			exec = "${pkgs.writeShellScript "aw-qt-start-wrapper" ''
					xdg-open http://localhost:5600 &
					notify-send "Opened ActivityWatch stats viewer in the browser!"
				''}";
			icon = "activitywatch";
		};
	};
}
