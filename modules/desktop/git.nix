{...}: {
  programs.git = {
    enable = true;
    settings.userName = "Your Name";
    settings.userEmail = "youremail@example.com";
    settings.extraConfig = {
      init.defaultBranch = "main";
      safe.directory = "/home/hadi-io/.config/nixos";
    };
  };
}
