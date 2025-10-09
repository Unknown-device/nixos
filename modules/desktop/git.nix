{...}: {
  programs.git = {
    enable = true;
    userName = "Your Name";
    userEmail = "youremail@example.com";
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = "/home/hadi-io/.config/nixos";
    };
  };
}
