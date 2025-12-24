{
  lib,
  modulesPath,
  ...
}: {
  networking.hostName = "enterprise";
  system.stateVersion = "25.11";

  imports = [
    (modulesPath + "/profiles/qemu-guest.nix")
    ./partitioning.nix
    ./options.nix
  ];

  boot.initrd.availableKernelModules = ["ahci" "xhci_pci" "virtio_pci" "sr_mod" "virtio_blk"];
  boot.kernelModules = ["kvm-amd"];
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
