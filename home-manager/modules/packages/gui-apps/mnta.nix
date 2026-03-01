{inputs, ...}: {
	home.packages = [
		inputs.mnta.packages.${inputs.system}.default
	];
}
