{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    kitty
    vesktop
    vscodium
  ];
}
