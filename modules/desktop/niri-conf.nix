{config, ...}: {
  home.file."${config.xdg.configHome}/niri/config.kdl".source =
    ../../misc/config.kdl;
}
