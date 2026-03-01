{...}: {
	programs.git = {
		enable = true;
		config = {
			user = {
				email = "khenzii@khenzii.dev";
				name = "Khenzii";
				signingkey = "71024D76746FDE06";
			};
			http = {
				postBuffer = 2097152000;
				lowSpeedLimit = 0;
			};
			core = {
				editor = "nvim";
				excludesfile = "~/.gitignore-global";
				sshCommand = "ssh -i ~/.ssh/id_rsa";
			};
			commit.gpgsign = true;
			rebase.instructionFormat = "(%an <%ae>) %s";
			push.autoSetupRemote = true;
			advice.defaultBranchName = false;
			"filter \"lfs\"" = {
				clean = "git-lfs clean -- %f";
				smudge = "git-lfs smudge -- %f";
				process = "git-lfs filter-process";
				required = true;
			};
		};
	};
}
