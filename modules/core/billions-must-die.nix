{lib, ...}: let
  inherit (lib) mkDefault;
in {
  environment.defaultPackages = mkDefault [];
  programs.nano.enable = false;
}
