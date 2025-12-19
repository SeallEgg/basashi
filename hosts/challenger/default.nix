{ inputs, lib, ... }:

{
  networking.hostName = "challenger";
  system.stateVersion = "25.11";

  imports =
    [
      inputs.disko.nixosModules.disko
      ./partitioning.nix
      ./options.nix
    ];

  boot.initrd.availableKernelModules = [ "nvme" "ehci_pci" "xhci_pci" "sdhci_pci" ];
  hardware.cpu.amd.updateMicrocode = true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  services.libinput.enable = true;
}
