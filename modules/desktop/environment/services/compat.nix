{ config, lib, pkgs, ... }: {
  options.basashi.services.compat.enable =
    lib.mkEnableOption "utilities to run traditional/sandbox linux binaries or scripts";
  config = lib.mkIf config.basashi.services.compat.enable {
    programs = {
      appimage = {
        enable = true;
        binfmt = true;
      };
      nix-ld = {
        enable = true;
        libraries = with pkgs; [ stdenv.cc.cc zlib curl glibc ];
      };
    };
  };
}
