{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.cfg.core.amdgpu;
in {
  options.cfg.core.amdgpu = {
    enable = mkEnableOption "amdgpu";
  };

  config = mkIf cfg.enable {
    hardware = {
      graphics = {
        enable = true;
        enable32Bit = true;
      };
      amdgpu.initrd.enable = true;
    };
    services.xserver.videoDrivers = ["amdgpu"];
  };
}
