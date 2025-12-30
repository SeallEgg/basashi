{
  pkgs,
  lib,
  config,
  hostConfig,
  ...
}: {
  boot = {
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
      grub = {
        device = "nodev";
        efiSupport = true;
      };
    };

    kernelParams = map (m: "video=${m.name}:${m.res}") hostConfig.monitors;

    tmp = {
      useTmpfs = true;
      tmpfsSize = "50%";
    };
  };

  services.swapspace.enable = true;
  zramSwap.enable = true;

  hardware.enableRedistributableFirmware = true;
}
