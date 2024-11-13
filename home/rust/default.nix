{
  pkgs,
  config,
  ...
}: {
  program.rust = {
    enable = true;
    package = pkgs.rustup;
  };

  home.packages = [
    pkgs.cargo
    pkgs.rustup
    pkgs.cargo-edit
    pkgs.cargo-deny
    pkgs.cargo-watch
    pkgs.rust-analyzer
  ];

  home.sessionVariables = {
    RUSTUP_HOME = "${config.home.homeDirectory}/.rustup";
    CARGO_HOME = "${config.home.homeDirectory}/.cargo";
  };
}
