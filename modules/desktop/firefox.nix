{
  config,
  pkgs,
  ...
}: {
  programs.librewolf = {
    enable = true;
    profiles.hadi-io = {
      settings = {
        "sidebar.verticalTabs" = true;
        "sidebar.verticalTabs.dragToPinPromo.dismissed" = true;
      };
    };
  };
}
