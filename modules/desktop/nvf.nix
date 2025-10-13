{pkgs, ...}: {
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        options = {
          foldcolumn = "1";
          foldlevel = 99;
          foldlevelstart = 99;
          foldenable = true;
          wrap = false;
        };
        binds = {
          whichKey.enable = true;
          whichKey.setupOpts.preset = "helix";
        };
        utility.preview.markdownPreview.alwaysAllowPreview = true;
        ui = {
          nvim-ufo.enable = true;
          borders.plugins.which-key.style = "shadow";
        };
        tabline.nvimBufferline.enable = true;
        statusline.lualine.enable = true;
        autocomplete.blink-cmp.enable = true;

        telescope.enable = true;
        telescope.extensions = [
          {
            name = "fzf";
            packages = [pkgs.vimPlugins.telescope-fzf-native-nvim];
            setup = {fzf = {fuzzy = true;};};
          }
        ];

        theme = {
          enable = true;
          name = "gruvbox";
          style = "dark";
        };

        viAlias = true;
        vimAlias = true;
        globals.mapleader = " ";
        maps.normal = {
          "<leader>e" = {
            action = "<cmd>lua require'mini.files'.open()<cr>";
            desc = "Open mini.files";
          };
        };

        lsp = {
          enable = true;
          formatOnSave = true;
        };
        languages = {
          enableTreesitter = true;
          nix = {
            lsp.server = "nixd";
            enable = true;
            format.enable = true;
          };
          css = {
            enable = true;
            format.enable = true;
          };
          html = {
            enable = true;
            format.enable = true;
          };
        };
      };
    };
  };
}
