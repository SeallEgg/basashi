{ config, lib, pkgs, ... }: {
  options.basashi.desktop.apps.kdeApps.enable =
    lib.mkEnableOption "the KDE file manager and viewer stack";

  config = lib.mkIf config.basashi.desktop.apps.kdeApps.enable {
    environment = {
      systemPackages = with pkgs; [
        kdePackages.qtsvg
        kdePackages.kio
        kdePackages.kio-fuse
        kdePackages.kio-admin
        kdePackages.kio-extras
        kdePackages.dolphin-plugins
      ];
      # Fix dolphin file associations. How hideous
      etc."xdg/menus/applications.menu".source =
        "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";
    };
    hj = {
      packages = with pkgs; [
        kdePackages.dolphin
        kdePackages.gwenview
        kdePackages.ark
        kdePackages.filelight
        kdePackages.okular
      ];
      xdg.config.files."kdeglobals" = {
        generator = lib.generators.toINI { };
        value = {
          General = {
            TerminalApplication = "kitty";
            BrowserApplication = "helium.desktop";
          };
          KDE.widgetStyle = "qt6ct";
          UiSettings.ColorScheme = "Darkly";
          Icons.Theme = "Papirus-Dark";
        };
      };
    };
  };
}
