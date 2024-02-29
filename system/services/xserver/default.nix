{
  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
    windowManager = { dwm.enable = true; };
    displayManager = {
      startx.enable = true;
      autoLogin.enable = true;
      autoLogin.user = "ms";
    };
    desktopManager = {
      #gnome.enable = true;
    };
    xkb = {
      layout = "us";
      options = "caps:swapescape";
      variant = "";
    };
  };
}
