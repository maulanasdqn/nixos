{ ... }: {
  home.username = "ms";
  home.homeDirectory = "/home/ms";
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
  imports = [ ./zsh ./git ./tmux ./direnv ./nvim ./starship ./packages ./st ];
}
