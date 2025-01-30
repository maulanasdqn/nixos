{config, ...}: {
  programs.zsh.enable = true;
  programs.zsh.enableCompletion = true;
  programs.zsh.autosuggestion.enable = true;
  programs.zsh.syntaxHighlighting.enable = true;
  programs.zsh.oh-my-zsh.enable = true;
  programs.zsh.oh-my-zsh.plugins = ["git" "ant"];
  programs.zsh.oh-my-zsh.theme = "intheloop";

  programs.zsh.initExtra = ''
    export PATH=~/.npm-packages/bin:$PATH
    export PATH=~/.grader/bin:$PATH
    export NODE_PATH=~/.npm-packages/lib/node_modules
    export XKB_DEFAULT_OPTIONS=caps:escape
    export PATH="$HOME/.local/bin:$PATH"
    export NIX_REMOTE=daemon
    export NIXPKGS_ALLOW_UNFREE=1
    export PATH="$HOME/.nix-profile/bin:/nix/var/nix/profiles/default/bin:$PATH"
    export PATH="$HOME/.nix-profile/sbin:/nix/var/nix/profiles/default/sbin:$PATH"
    export PATH="$HOME/.nix-profile/libexec:$PATH"
    export PATH="$HOME/.cargo/bin:$PATH"
    export NIX_PATH=$HOME/.nix-defexpr/channels:$NIX_PATH
    export NODE_OPTIONS=--max_old_space_size=4096
    export DIRENV_LOG_FORMAT=
    source ~/.config/nix/config/home/zsh/z.sh
  '';

  programs.zsh.shellAliases.u = "nix flake update ~/.config/nixos";
  programs.zsh.shellAliases.b = "sudo nixos-rebuild switch --flake ~/.config/nix/config#beast --impure";
  programs.zsh.shellAliases.clean = "sudo nix-collect-garbage -d";
  programs.zsh.shellAliases.ls = "eza --icons";
  programs.zsh.shellAliases.pn = "pnpm";
  programs.zsh.shellAliases.px = "pnpx";
  programs.zsh.shellAliases.yr = "yarn";
  programs.zsh.shellAliases.bn = "bun";
  programs.zsh.shellAliases.bx = "bunx";
  programs.zsh.shellAliases.np = "npm";
  programs.zsh.shellAliases.lsa = "eza -a --icons";
  programs.zsh.shellAliases.ll = "eza -l --icons";
  programs.zsh.shellAliases.c = "clear";
  programs.zsh.shellAliases.v = "nvim";
  programs.zsh.shellAliases.t = "tmux";

  programs.zsh.history = {
    size = 10000;
    path = "${config.xdg.dataHome}/zsh/history";
  };
}
