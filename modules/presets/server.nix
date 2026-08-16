{ config, lib, ... }:
let def = lib.mkOverride 900;
in {
  options.basashi.presets.server = lib.mkEnableOption "headless host defaults";
  config = lib.mkIf config.basashi.presets.server {
    basashi = {
      presets.locale = def true;
      core.swap.zram = {
        enable = def true;
        algorithm = def "zstd";
      };
      services.avahi.enable = def true;
    };
  };
}
