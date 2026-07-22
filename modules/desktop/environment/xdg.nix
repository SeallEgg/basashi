{ inputs, pkgs, ... }: {
  imports = [ inputs.nixdg-ninja.nixosModules.nixdg-ninja ];

  options.basashi.desktop.environment.xdg.enable =
    lib.mkEnableOption "xdg portal routing and mime defaults";

  config = lib.mkIf config.basashi.desktop.environment.xdg.enable {
    programs.nixdg-ninja.enable = true;

    xdg = {
      mime.defaultApplications = {
        "inode/directory" = "org.kde.dolphin.desktop";
        "text/*" = "dev.zed.Zed.desktop";
        "image/*" = "org.kde.gwenview.desktop";
        "video/*" = "mpv.desktop";
        "audio/*" = "mpv.desktop";
        "application/pdf" = "org.kde.okular.desktop";
      };

      portal = {
        enable = true;
        extraPortals = [ pkgs.kdePackages.xdg-desktop-portal-kde pkgs.xdg-desktop-portal-gtk ];
        config.common.default = [ "kde" ];
      };
    };
  };
}
