{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    alejandra
    micro
    neovim
    fastfetch
    btop
  ];
}
