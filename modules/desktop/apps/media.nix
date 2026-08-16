{ config, lib, pkgs, ... }: {
  options.basashi.desktop.apps.media.enable =
    lib.mkEnableOption "media players and editors";

  config = lib.mkIf config.basashi.desktop.apps.media.enable {
    hj.packages = with pkgs; [ cider-2 gimp mpv ];
  };
}
