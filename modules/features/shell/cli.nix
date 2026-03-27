{
  flake.nixosModules.cli = { pkgs, ... }:
    {
      environment.sytemPackages = with pkgs; [
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
      environment.shellAliases = {
        z = "cd";
        ls = "eza --icons";
        ll = "eza -l --icons";
        la = "eza -a --icons";
        lt = "eza --tree --icons";
        lla = "eza -la --icons";
      };
    };
}
