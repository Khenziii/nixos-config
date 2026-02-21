{ pkgs, shared-inputs, ... }:

{
	virtualisation = {
		libvirtd = {
			enable = true;

			onBoot = "ignore";
			onShutdown = "shutdown";

			qemu = {
				package = pkgs.qemu_kvm;
				swtpm.enable = true;

				runAsRoot = false;

				verbatimConfig = ''
					s = []
					user = "+${shared-inputs.username}"
				'';

				vhostUserPackages = with pkgs; [
					virtiofsd
				];
			};
		};
	};

	boot = {
		initrd.kernelModules = [
			"vfio"
			"vfio_pci"
			"vfio_iommu_type1"
		];
		kernelParams = [
			"iommu=pt"
			"kvm.ignore_msrs=1"
		];
	};

	users.users.${shared-inputs.username}.extraGroups = [ "libvirtd" "qemu-libvirtd" ];
}
