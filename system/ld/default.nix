{ pkgs, ... }: {
  programs.nix-ld.enable = false;
  programs.nix-ld.libraries = with pkgs; [
    bun
    nodejs
    nodePackages.yarn
    nodePackages.npm
    nodePackages.pnpm
  ];
}
