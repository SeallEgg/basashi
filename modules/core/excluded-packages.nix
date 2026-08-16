{ lib, pkgs, ... }: {
  programs.nano.enable = false;
  environment = {
    systemPackages = [ pkgs.micro ];
    defaultPackages = [ ];
  };
  documentation.doc.enable = lib.mkForce false;
}
