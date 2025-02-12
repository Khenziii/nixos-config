{ ... }:

{
  virtualisation.docker = {
    enable = true;
	enableOnBoot = true;
    # Necessary to run docker swarms.
    liveRestore = false;
  };
}

