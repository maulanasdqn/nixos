{pkgs, ...}: {
  home.packages = with pkgs; [vscode];
  programs.vscode = {
    enable = true;
    settings = {
      "javascript.updateImportsOnFileMove.enabled" = true;
      "typescript.updateImportsOnFileMove.enabled" = true;
    };
    extensions = [
      "ms-vscode.cpptools"
      "astro-build.astro-vscode"
      "esbenp.prettier-vscode"
      "dbaeumer.vscode-eslint"
      "wix.vscode-import-cost"
      "wix.vscode-gradle"
    ];
  };
}
