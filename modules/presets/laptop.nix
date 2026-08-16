{ config, lib, ... }:
let def = lib.mkOverride 900;
in {
  options.basashi.presets.laptop =
    lib.mkEnableOption "the laptop preset, which is a superset of the desktop one";

  config = lib.mkIf config.basashi.presets.laptop {
    basashi = {
      presets.desktop = def true;
      core.swap.zram.enable = def true;

      services = {
        powersaving.enable = def true;
        # hibernation needs to be set manually and should be enabled on these hosts
      };
    };

    services.libinput.enable = def true; # touchpad
    # fix keyboards/touchpads not working if touched during boot
    # (resets the PS/2 controller)
    boot.kernelParams = [ "i8042.reset" ];
  };
}
