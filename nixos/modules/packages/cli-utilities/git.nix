{ ... }:

{
	programs.git = {
		enable = true;
		config = {
			user = {
				email = "khenzii@khenzii.dev";
				name = "Khenzii";
			};

			http = {
				postBuffer = 2097152000;
				lowSpeedLimit = 0;
			};

			core = {
				editor = "nvim";
				excludesfile = "~/.gitignore-global";
				sshCommand = "ssh -i ~/.ssh/git"; # TODO: change to your ssh key
			};

			commit = {
				gpgsign = true;
			};

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
