{
  inputs,
  lib,
  ...
}: {
  options.colorscheme = lib.mkOption {
    type = lib.types.str;
    default = inputs.nix-colors.colorSchemes.rose-pine;
    description = "The global color scheme for all applications.";
  };

  config = {
    colorscheme = inputs.nix-colors.colorSchemes.rose-pine;
  };
}
