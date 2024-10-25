{pkgs, ...}: {
  programs.nixvim = {
    enable = true;
    globals.mapleader = " ";
    colorschemes.catppuccin.enable = true;
    opts = {
      number = true;
      shiftwidth = 2;
      tabstop = 2;
      expandtab = true;
      autoindent = true;
      ignorecase = true;
      smartcase = true;
      cursorline = true;
      termguicolors = true;
      background = "dark";
      signcolumn = "yes";
      backspace = "indent,eol,start";
      splitright = true;
      splitbelow = true;
      clipboard = "unnamedplus";
      updatetime = 300;
      scrolloff = 3;
      wildignorecase = true;
      cmdheight = 0;
      showmode = false;
      guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50";
      wrap = false;
    };
    keymaps = [
      {
        action = "<cmd>Telescope find_files<CR>";
        key = "<leader>s";
        mode = "n";
        options.silent = true;
      }
      {
        action = "<cmd>Telescope buffers<CR>";
        key = "<leader>b";
        mode = "n";
        options.silent = true;
      }
      {
        action = "<cmd>Telescope live_grep<CR>";
        key = "<leader>m";
        mode = "n";
        options.silent = true;
      }
      {
        action = "<cmd>Lspsaga term_toggle<CR>";
        key = "<leader>t";
        mode = "n";
        options.silent = true;
      }
      {
        action = "<cmd>Lspsaga goto_definition<CR>";
        key = "f";
        mode = "n";
        options.silent = true;
      }
      {
        action = "<cmd>Lspsaga peek_definition<CR>";
        key = "F";
        mode = "n";
        options.silent = true;
      }
      {
        action = "<cmd>Lspsaga hover_doc<CR>";
        key = "D";
        mode = "n";
        options.silent = true;
      }
      {
        action = "<cmd>Lspsaga code_action<CR>";
        key = "Q";
        mode = "n";
        options.silent = true;
      }
      {
        action = "<cmd>Lspsaga diagnostic_jump_next<CR>";
        key = "e";
        mode = "n";
        options.silent = true;
      }
      {
        action = "<cmd>Lspsaga diagnostic_jump_prev<CR>";
        key = "E";
        mode = "n";
        options.silent = true;
      }
      {
        action = "<cmd>NvimTreeToggle<CR>";
        key = "<leader>f";
        mode = "n";
        options.silent = true;
      }
    ];

    plugins = {
      web-devicons.enable = true;
      nvim-autopairs.enable = true;
      nix.enable = true;
      luasnip.enable = true;
      telescope.enable = true;
      nvim-tree.enable = true;
      trouble.enable = true;
      copilot-vim.enable = true;
      wtf.enable = true;
      lsp-format.enable = true;
      noice.enable = false;
      noice.notify.enabled = false;
      lspkind.enable = true;
      lspkind.cmp.enable = true;
      cmp-nvim-lsp.enable = true;
      cmp-nvim-lsp-document-symbol.enable = true;
      cmp-nvim-lsp-signature-help.enable = true;
      cmp_luasnip.enable = true;
      cmp-path.enable = true;
      cmp-buffer.enable = true;
      cmp-cmdline.enable = true;
      cmp-spell.enable = true;
      cmp-dictionary.enable = true;
      cmp-treesitter.enable = true;
      cmp-fish.enable = false;
      cmp-tmux.enable = false;
      conform-nvim = {
        enable = true;
        settings = {
          format_on_save = {
            lspFallback = true;
            timeoutMs = 500;
          };
          formatters_by_ft = {
            liquidsoap = ["liquidsoap-prettier"];
            html = [["prettierd" "prettier"]];
            css = [["prettierd" "prettier"]];
            javascript = ["prettier"];
            javascriptreact = ["prettier"];
            typescript = ["prettier"];
            typescriptreact = ["prettier"];
            python = ["black"];
            lua = ["stylua"];
            nix = ["alejandra"];
            markdown = ["prettier"];
            yaml = ["yamllint" "yamlfmt"];
          };
        };
      };
      lspsaga = {
        enable = true;
        lightbulb.enable = false;
      };
      treesitter = {
        enable = true;
        nixGrammars = true;
        nixvimInjections = true;
        treesitterPackage = pkgs.tree-sitter;
        settings = {
          indent.enable = true;
          ensure_installed = ["nix" "tsx" "typescript" "javascript" "json" "lua" "markdown" "markdown_inline"];
        };
      };
      cmp = {
        enable = true;
        settings = {
          mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<Down>" = "cmp.mapping.select_next_item()";
            "<Up>" = "cmp.mapping.select_prev_item()";
          };
          settings = {
            completeopt = "menu,menuone,noselect";
          };
          sources = [
            {name = "nvim_lsp";}
            {name = "luasnip";}
          ];
          extraOptions = {
            snippet = {
              expand = ''
                function(args)
                  require('luasnip').lsp_expand(args.body)
                end
              '';
            };
            window = {
              completion.bordered = true;
              documentation.bordered = true;
            };
          };
        };
      };
      lsp = {
        enable = true;
        servers = {
          ts_ls.enable = true;
          lua_ls.enable = true;
          nil_ls.enable = true;
          emmet_ls.enable = true;
          tailwindcss.enable = true;
          eslint.enable = true;
          volar.enable = true;
        };
      };
    };
  };
}
