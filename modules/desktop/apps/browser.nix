{ config, inputs, lib, pkgs, ... }: {
  options.basashi.desktop.apps.browser.enable =
    lib.mkEnableOption "the helium browser";

  config = lib.mkIf config.basashi.desktop.apps.browser.enable {
    hj.packages =
      [ inputs.helium.packages.${pkgs.stdenv.hostPlatform.system}.default ];
  };
}
