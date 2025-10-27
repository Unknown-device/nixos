{
  programs.git = {
    enable = true;

    settings = {
      user.name = "hadi-io";
      user.email = "admin@hadi-io.dev";
      init.defaultBranch = "main";
      safe.directory = "/home/hadi-io/.config/nixos";
    };
  };
}
