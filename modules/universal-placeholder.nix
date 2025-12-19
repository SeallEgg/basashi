{ pkgs, ...}:

{
    networking.networkmanager.enable = true;
    services.openssh.enable = true;

    services.xserver.enable = true;
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;

    services.printing.enable = true;
    services.pipewire = {
    enable = true;
    pulse.enable = true;
    };

    programs.firefox.enable = true;

    environment.systemPackages = with pkgs; [
        micro
        neovim
        fastfetch
        btop
        kitty
        git
    ];
}
