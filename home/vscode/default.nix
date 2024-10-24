{pkgs, ...}: {
  home.packages = with pkgs; [vscode];
  programs.vscode = {
    enable = false;
  };
}
