{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.cfg.services.swww;
in {
  options.cfg.services.swww = {
    enable = mkEnableOption "swww";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [swww];
    systemd.user.services.swww = {
      enable = true;
      description = "Wayland wallpaper daemon";
      partOf = ["graphical-session.target"];
      serviceConfig = {
        ExecStart = "${pkgs.swww}/bin/swww-daemon";
        Restart = "on-failure";
      };
    };
  };
}
