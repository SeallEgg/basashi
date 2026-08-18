{ config, lib, ... }: {
  options.basashi.services.homeAssistant.enable = lib.mkEnableOption "home assistant";
  config = lib.mkIf config.basashi.services.homeAssistant.enable {
    services.home-assistant = { enable = true; };
  };
}
