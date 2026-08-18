{ config, lib, pkgs, ... }: {
  options.basashi.desktop.apps.modeling.enable =
    lib.mkEnableOption "3d modeling and 3d printing apps";

  config = lib.mkIf config.basashi.desktop.apps.modeling.enable {
    hj.packages = with pkgs; [ freecad blender orca-slicer ];
  };
}
