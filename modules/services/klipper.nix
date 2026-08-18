{ config, lib, ... }: {
  options.basashi.services.klipper.enable = lib.mkEnableOption "3d printer hosting";

  config = lib.mkIf config.basashi.services.klipper.enable {
    services = {
      klipper = { enable = true; };
      mainsail = { enable = true; };
      moonraker = { enable = true; };
      # wip
    };
  };
}
