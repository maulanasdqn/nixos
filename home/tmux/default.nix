{pkgs, ...}: {
  programs.tmux.enable = true;
  programs.tmux.clock24 = true;
  programs.tmux.plugins = with pkgs.tmuxPlugins; [
    sensible
    yank
    resurrect
    {
      plugin = rose-pine;
      extraConfig = ''
        set -g @rose_pine_variant 'main'
        set -g @rose_pine_directory 'on'
        set -g @rose_pine_bar_bg_disable 'on'
        set -g @rose_pine_host on
        set -g mouse on
      '';
    }
  ];
}
