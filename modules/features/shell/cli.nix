{
  flake.nixosModules.cli = { pkgs, ... }:
    {
            programs.zoxide.enable = true;
      users.defaultUserShell = pkgs.fish;
      programs.fish.enable = true;

      environment.systemPackages = with pkgs; [
        git
        dig
        app2unit
        bluez-tools
        ntfs3g
        file
        unzip
        zip
        p7zip
        wget
        killall
        sshfs
        fzf
        htop
        btop
        eza
        fd
        dust
        ripgrep
        fastfetch
        tree-sitter
        imagemagick
        ffmpeg-full
        yt-dlp
        lazygit
      ];
    };
}
