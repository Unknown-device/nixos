{
  config,
  pkgs,
  ...
}: {
  programs.niri.enable = true;
  xdg.icons.enable = true;
  environment.systemPackages = [
    pkgs.gruvbox-plus-icons
  ];
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    QT_QPA_PLATFORM = "wayland";
    XDG_SESSION_TYPE = "wayland";
    GDK_BACKEND = "wayland";
  };
}
