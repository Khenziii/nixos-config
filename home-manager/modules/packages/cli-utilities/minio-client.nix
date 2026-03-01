{pkgs, ...}: {
	home.packages = with pkgs; [
		minio-client
	];
}
