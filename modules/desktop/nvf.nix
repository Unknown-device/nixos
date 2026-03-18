{pkgs, ...}: {
  programs.nvf = {
    enable = true;

    settings = {
      vim = {
        ## --------------------------------------------------
        ## Core options
        ## --------------------------------------------------
        options = {
          foldcolumn = "1";
          foldlevel = 99;
          foldlevelstart = 99;
          foldenable = true;

          wrap = false;

          tabstop = 2;
          shiftwidth = 2;
          expandtab = true;
          autoindent = true;
        };

        globals.mapleader = " ";
        viAlias = true;
        vimAlias = true;

        ## --------------------------------------------------
        ## keybinds
        ## --------------------------------------------------
        binds.whichKey = {
          enable = true;
          setupOpts.preset = "helix";
        };

        ## --------------------------------------------------
        ## UI
        ## --------------------------------------------------
        ui = {
          borders = {
            enable = true;
            plugins.which-key.style = "shadow";
          };

          nvim-ufo.enable = true;
          noice.enable = true;
          colorizer.enable = true;
        };
        theme.name = "gruvbox";
        theme.enable = true;
        theme.style = "dark";

        tabline.nvimBufferline.enable = true;
        statusline.lualine.enable = true;

        ## --------------------------------------------------
        ## Editing behavior
        ## --------------------------------------------------
        autopairs.nvim-autopairs.enable = true;

        ## --------------------------------------------------
        ## Telescope
        ## --------------------------------------------------
        telescope = {
          enable = true;

          extensions = [
            {
              name = "fzf";
              packages = [pkgs.vimPlugins.telescope-fzf-native-nvim];
              setup.fzf.fuzzy = true;
            }
          ];
        };

        ## --------------------------------------------------
        ## Git
        ## --------------------------------------------------
        git = {
          enable = true;

          gitsigns = {
            enable = true;
            codeActions.enable = false;
          };

          neogit.enable = true;
        };

        ## --------------------------------------------------
        ## Autocomplete
        ## --------------------------------------------------
        autocomplete.blink-cmp = {
          enable = true;
        };

        ## --------------------------------------------------
        ## Treesitter
        ## --------------------------------------------------
        treesitter = {
          autotagHtml = true;
        };

        ## --------------------------------------------------
        ## LSP
        ## --------------------------------------------------
        lsp = {
          enable = true;
          formatOnSave = false;
          trouble.enable = true;
        };

        ## --------------------------------------------------
        ## Languages
        ## --------------------------------------------------
        languages = {
          enableTreesitter = true;
          enableFormat = true;
          enableExtraDiagnostics = true;

          nix = {
            enable = true;
            lsp.servers = ["nixd"];
          };

          css.enable = true;
          html.enable = true;
          json.enable = true;
          markdown.enable = true;
          clang.enable = true;
          rust.enable = true; 
          ts.enable = true;
        };

        ## --------------------------------------------------
        ## Misc utilities
        ## --------------------------------------------------

        utility = {
          ccc.enable = true;
        };
        notes = {
          todo-comments.enable = true;
        };

      };
    };
  };
}
