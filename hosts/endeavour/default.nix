{ self', lib, pkgs, modulesPath, ... }:

{
  system.stateVersion = "25.11";
  imports =
    [
      (modulesPath + "/profiles/qemu-guest.nix")
      ./partitioning.nix
      ./options.nix
    ];

  boot.initrd.availableKernelModules = [ "ahci" "xhci_pci" "virtio_pci" "sr_mod" "virtio_blk" ];
  boot.kernelModules = [ "kvm-amd" ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  networking.hostName = "armando";
  networking.networkmanager.enable = true;
  services.openssh.enable = true;

  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.printing.enable = true;

  services.pipewire = {
     enable = true;
     pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  nixpkgs.config.allowUnfree = true;
  programs.nh.enable = true;
  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    micro
    neovim
    fastfetch
    btop
    kitty
  ];

}
