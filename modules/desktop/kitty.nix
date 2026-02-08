{
  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
    extraConfig = ''
      cursor_shape beam
      bold_font        auto
      italic_font      auto
      bold_italic_font auto
    '';
  };
}
