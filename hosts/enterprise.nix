{
  basashi = {
    presets.terminal = true;

    core = {
      username = "seal";
      virtualization.guest = {
        enable = true;
        sharedDirectory = "/home/seal";
      };
      swap = {
        file.enable = false;
        zram.enable = true;
      };
    };
  };
}
