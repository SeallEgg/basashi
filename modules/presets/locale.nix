{ config, lib, ... }:
let def = lib.mkOverride 900;
in {
  options.basashi.presets.locale = lib.mkEnableOption "seal's default locale & keyboard options";
  config = lib.mkIf config.basashi.presets.locale {
    i18n = {
      defaultLocale = def "en_DK.UTF-8";
      extraLocaleSettings = { LC_MONETARY = def "pt_BR.UTF-8"; };
    };
    time.timeZone = def "America/Sao_Paulo";
    services.xserver.xkb = {
      layout = def "us";
      variant = def "intl";
    };
  };
}
