{ config, lib, pkgs, ... }: {
  options.basashi.desktop.apps.zed.enable =
    lib.mkEnableOption "the zed editor and nix tooling";

  config = lib.mkIf config.basashi.desktop.apps.zed.enable {
    hj.packages = with pkgs; [
      zed-editor
      haskellPackages.nixfmt
      statix
      deadnix
      nixd
    ];
  };
}
