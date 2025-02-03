{
  programs.nixvim = {
    enable = false;
    globals.mapleader = " ";
    colorschemes.rose-pine = {
      enable = true;
      settings = {
        before_highlight = "function(group, highlight, palette) end";
        dark_variant = "dawn";
        dim_inactive_windows = true;
        enable = {
          legacy_highlights = false;
          migrations = true;
          terminal = true;
        };
        extend_background_behind_borders = false;
        groups = {
          border = "muted";
          link = "iris";
          panel = "surface";

          error = "love";
          hint = "iris";
          info = "foam";
          note = "pine";
          todo = "rose";
          warn = "gold";

          git_add = "foam";
          git_change = "rose";
          git_delete = "love";
          git_dirty = "rose";
          git_ignore = "muted";
          git_merge = "iris";
          git_rename = "pine";
          git_stage = "iris";
          git_text = "rose";
          git_untracked = "subtle";

          h1 = "iris";
          h2 = "foam";
          h3 = "rose";
          h4 = "gold";
          h5 = "pine";
          h6 = "foam";
        };
        highlight_groups = {};
        styles = {
          bold = true;
          italic = true;
          transparency = false;
        };
        variant = "main";
      };
    };
    opts = {
      number = true;
      winbar = "";
      shiftwidth = 2;
      laststatus = 0;
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
      scrolloff = 4;
      wildignorecase = true;
      cmdheight = 0;
      showtabline = 0;
      showmode = false;
      guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50";
      wrap = false;
    };
    keymaps = [
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
      {
        action = "<cmd>Telescope find_files<CR>";
        key = "<leader>s";
        mode = "n";
        options.silent = true;
      }
      {
        action = "<cmd>Telescope live_grep<CR>";
        key = "<leader>S";
        mode = "n";
        options.silent = true;
      }
      {
        action = "<cmd>Telescope buffers<CR>";
        key = "<leader>b";
        mode = "n";
        options.silent = true;
      }
    ];

    plugins = {
      copilot-vim = {
        enable = true;
        autoLoad = true;
      };
      avante = {
        enable = true;
        autoLoad = true;
        settings = {
          openai = {
            endpoint = "https://api.openai.com/v1";
            max_tokens = 4096;
            model = "gpt-4o";
            temperature = 0;
          };
          diff = {
            autojump = true;
            debug = false;
            list_opener = "copen";
          };
          highlights = {
            diff = {
              current = "DiffText";
              incoming = "DiffAdd";
            };
          };
          hints = {
            enabled = true;
          };
          mappings = {
            diff = {
              both = "cb";
              next = "]x";
              none = "c0";
              ours = "co";
              prev = "[x";
              theirs = "ct";
            };
          };
          provider = "openai";
          windows = {
            sidebar_header = {
              align = "center";
              rounded = true;
            };
            width = 30;
            wrap = true;
          };
        };
      };
      noice = {
        enable = true;
        settings = {
          cmdline = {
            enabled = true;
            view = "cmdline_popup";
            opts = {};
            format = {
              cmdline = {
                pattern = "^:";
                icon = "";
                lang = "vim";
              };
              search_down = {
                kind = "search";
                pattern = "^/";
                icon = " ";
                lang = "regex";
              };
              search_up = {
                kind = "search";
                pattern = "^%?";
                icon = " ";
                lang = "regex";
              };
              filter = {
                pattern = "^:%s*!";
                icon = "$";
                lang = "bash";
              };
              help = {
                pattern = "^:%s*he?l?p?%s+";
                icon = "";
              };
              input = {
                view = "cmdline_input";
                icon = "󰥻 ";
              };
            };
          };
        };
      };
      web-devicons.enable = true;
      nvim-autopairs.enable = true;
      nix.enable = true;
      luasnip.enable = true;
      nvim-tree = {
        enable = true;
        view = {
          float.enable = true;
        };
      };
      lualine = {
        enable = false;
      };
      trouble.enable = true;
      telescope = {
        enable = true;
        extensions = {
          file-browser.enable = true;
          fzf-native.enable = true;
          fzy-native.enable = true;
          live-grep-args.enable = true;
          media-files.enable = true;
        };
      };
      lsp-format.enable = true;
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
      wakatime.enable = true;
      conform-nvim = {
        enable = true;
        settings = {
          format_on_save = {
            lspFallback = true;
            timeoutMs = 5000;
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
        settings = {
          auto_install = true;
          ensure_installed = ["nix" "tsx" "javascript" "astro" "css" "html" "json" "lua" "python" "yaml"];
          highlight = {
            additional_vim_regex_highlighting = true;
            custom_captures = {};
            disable = [];
            enable = true;
          };
          ignore_install = [];
          incremental_selection = {
            enable = true;
            keymaps = {
              init_selection = false;
              node_decremental = "grm";
              node_incremental = "grn";
              scope_incremental = "grc";
            };
          };
          indent = {
            enable = true;
          };
          parser_install_dir = {
            __raw = "vim.fs.joinpath(vim.fn.stdpath('data'), 'treesitter')";
          };
          sync_install = false;
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
          rust_analyzer = {
            enable = true;
            autostart = true;
            installRustc = false;
            installCargo = false;
            settings = {
              diagnostics = {
                enable = true;
              };
              cargo = {
                allFeatures = true;
              };
            };
          };
        };
      };
    };
  };
}
