{ pkgs, lib, config, ... }:

{
    boot.loader = {
        efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
        };
        grub = {
        device = "nodev";
        efiSupport = true;
        };
    };

    tmp = {
        useTmpfs = true;
        tmpfsSize = "50%";
    };
    services.swapspace.enable = true;
    zramSwap.enable = true;

    time.timeZone = "America/Sao_Paulo";
}
