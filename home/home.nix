{pkgs, ...}: {
  imports = [
    ../modules/desktop/starship.nix
    ../modules/desktop/xdg.nix
    ../modules/desktop/git.nix
    ../modules/desktop/hm-files.nix
    ../modules/desktop/fish.nix
    ../modules/desktop/stylix.nix
    ../modules/desktop/noctalia.nix

    ../modules/desktop/spicetify.nix
    ../modules/desktop/yazi.nix
    ../modules/desktop/kitty.nix
    ../modules/desktop/alias.nix
    ../modules/desktop/nvf.nix
    ../modules/desktop/prism.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home.username = "hadi-io";
  home.homeDirectory = "/home/hadi-io";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    vim
    libreoffice-fresh
    rar
    glib
    bottles
    steam
    chromium
    nodejs_25
    vlc
    zip
    nemo
    gtk3
    ffmpeg
    kdePackages.kget
    unzip
    bibata-cursors
    zoom-us
    lazygit
    fd
    dragon-drop
    ripgrep
    bat
    ncdu
    fzf
    btop
    eza
    neovim
    vesktop
    git
    pavucontrol
    prismlauncher
  ];

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  programs.starship.enableFishIntegration = true;

  programs.fastfetch.enable = true;

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/hadi-io/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
