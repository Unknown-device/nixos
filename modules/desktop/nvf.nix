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
        ## Keybinds
        ## --------------------------------------------------
        binds.whichKey = {
          enable = true;
          setupOpts.preset = "helix";
        };

        maps.normal."<leader>e" = {
          action = "<cmd>lua require('mini.files').open()<cr>";
          desc = "Open mini.files";
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

        tabline.nvimBufferline.enable = true;
        statusline.lualine.enable = true;

        visuals = {
          fidget-nvim.enable = true;
          cellular-automaton.enable = true;
        };

        ## --------------------------------------------------
        ## Editing behavior
        ## --------------------------------------------------
        autopairs.nvim-autopairs.enable = true;

        comments.comment-nvim.enable = true;

        spellcheck.enable = true;

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
          formatOnSave = true;
          lightbulb.enable = true;
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
          nim.enable = true;
          ts.enable = true;
        };

        ## --------------------------------------------------
        ## Misc utilities
        ## --------------------------------------------------

        utility = {
          preview.markdownPreview.alwaysAllowPreview = true;
          vim-wakatime.enable = true;
        };

        ## --------------------------------------------------
        ## Theme
        ## --------------------------------------------------
        theme = {
          enable = true;
          name = "gruvbox";
          style = "dark";
        };
      };
    };
  };
}
