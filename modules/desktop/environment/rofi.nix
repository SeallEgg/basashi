{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.cfg.desktop.environment.rofi;
in {
  options.cfg.desktop.environment.rofi = {
    enable = mkEnableOption "rofi";
  };

  config = mkIf cfg.enable {
    hj = {
      packages = [pkgs.rofi];
    };
  };
}
