{
  config,
  lib,
  ...
}: let
  inherit (lib) mkOption types;
  cfg = config.cfg.core.git;
in {
  options.cfg.core.git = {
    name = mkOption {
      type = types.str;
      default = "";
      description = "Username for git.";
    };
    email = mkOption {
      type = types.str;
      default = "";
      description = "Email address for git.";
    };
  };
  config = {
    hj.rum.programs.git = {
      enable = true;
      settings = {
        user = {
          inherit (cfg) name email;
        };
        url."https://github.com/".InsteadOf = "github:";
        init.defaultBranch = "main";
      };
    };
  };
}
