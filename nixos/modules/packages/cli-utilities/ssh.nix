{...}: {
	programs.ssh = {
		startAgent = true;
		extraConfig = "AddKeysToAgent yes";
	};
}
