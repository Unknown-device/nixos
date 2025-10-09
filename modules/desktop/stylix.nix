{
  stylix,
  pkgs,
  ...
}: {
  stylix.enable = true;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";

  # Don’t forget to apply wallpaper

  stylix.image = ../../hosts/L-E5470/Wallpapers/wallhaven-eyw5qw_3840x1600.png;

  stylix.cursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
  };

  stylix.fonts = {
    monospace = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono Nerd Font Mono";
    };
    sansSerif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans";
    };
    serif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Serif";
    };
  };
}
