{
  cfg = {
    core = {
      username = "seal";
      nvidia.enable = true;
      forceCompiledPkgs = {
        enable = true;
        pkgs = [
          "nix"
          "gcc"
        ];
      };
    };
    desktop = {
      apps = {
        gaming.enable = true;
      };
    };
    services = {
      swww.enable = true;
    };
  };
}
