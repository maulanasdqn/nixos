{
  services.xserver = {
    enable = true;
    displayManager = {
      gdm.enable = true;
      autoLogin.enable = true;
      autoLogin.user = "ms";
    };
    desktopManager = { gnome.enable = true; };
    xkb = {
      layout = "us";
      variant = "";
    };
  };
}
