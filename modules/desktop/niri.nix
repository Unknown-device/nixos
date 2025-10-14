{
  config,
  pkgs,
  ...
}: {
  programs.niri.enable = true;
  xdg.configFile."niri/config.kdl".source = ../../misc/config.kdl;
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    QT_QPA_PLATFORM = "wayland";
    XDG_SESSION_TYPE = "wayland";
    GDK_BACKEND = "wayland";
  };
}
