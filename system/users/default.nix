{ pkgs, ... }: {
  users.users.ms = {
    isNormalUser = true;
    description = "Maulana Sodiqin";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.zsh;
  };
}
