{ config, lib, ... }: {
  options.basashi.desktop.apps.thunderbird.enable =
    lib.mkEnableOption "thunderbird and the protonmail bridge";
  config = lib.mkIf config.basashi.desktop.apps.thunderbird.enable {
    programs.thunderbird = { enable = true; };
    services.protonmail-bridge.enable = true;
  };
}
