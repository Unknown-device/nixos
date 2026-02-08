{pkgs, ...}: {
  stylix.enable = true;
  stylix.autoEnable = true;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark.yaml";

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
    sizes.terminal = 10;
  };

  stylix.targets.starship.enable = false;
  stylix.targets.nvf.enable = false;
  stylix.targets.zen-browser = {
    enable = true;
    enableCss = true;
    profileNames = ["Hadi-io" "Default" "pmdvfwmi.Default Profile"];
  };
}
