{
  services.xserver = {
    enable = true;
    videoDrivers = [ "amdgpu" ];
    windowManager = { dwm.enable = false; };
    displayManager = {
      startx.enable = false;
      autoLogin.enable = false;
      autoLogin.user = "ms";
    };
    desktopManager = { gnome.enable = false; };
    xkb = {
      layout = "us";
      options = "caps:swapescape";
      variant = "";
    };
  };
}
