{pkgs, ...}: {
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    bun
    nodejs
    nodePackages.yarn
    nodePackages.npm
    nodePackages.pnpm
  ];
}
