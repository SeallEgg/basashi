{ config, lib, pkgs, ... }: {
  options.basashi.desktop.apps.chat.enable = lib.mkEnableOption "chat clients";

  config = lib.mkIf config.basashi.desktop.apps.chat.enable {
    hj.packages = [ pkgs.equibop ];
  };
}
