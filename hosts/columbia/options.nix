{
  cfg = {
    core = {
      username = "seal";
      nvidia.enable = true;
      git.name = "SeallEgg";
      git.email = "seallegg@gmail.com";
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
