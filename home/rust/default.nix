{
  pkgs,
  config,
  ...
}: {
  home.packages = [
    pkgs.rustup
  ];

  home.sessionVariables = {
    RUSTUP_HOME = "${config.home.homeDirectory}/.rustup";
    CARGO_HOME = "${config.home.homeDirectory}/.cargo";
  };
}
