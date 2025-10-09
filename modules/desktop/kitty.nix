{
  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
    font = {
      name = "JetBrainsMono Nerd Font Mono";
      size = 9;
    };
    extraConfig = ''
      cursor_shape beam
      bold_font        auto
      italic_font      auto
      bold_italic_font auto
    '';
  };
}

