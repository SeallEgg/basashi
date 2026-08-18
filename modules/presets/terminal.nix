{ config, lib, pkgs, ... }:
let def = lib.mkOverride 900;
in {
  options.basashi.presets.terminal = lib.mkEnableOption "the shared shell bundle";
  config = lib.mkIf config.basashi.presets.terminal {
    basashi.terminal = {
      fish.enable = def true;
      git = {
        email = def "seallegg@pm.me";
        name = def "seallegg";
      };
      ohMyPosh.enable = def true;
      rusty.enable = def true;
    };
    environment.systemPackages = with pkgs; [ neovim fastfetch btop usbutils ];
  };
}
