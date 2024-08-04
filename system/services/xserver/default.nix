{
  services.xserver = {
    displayManager.gdm.enable = false;
    desktopManager.gnome.enable = false;
    enable = true;
    videoDrivers = ["amdgpu"];
    xkb = {
      layout = "us";
      options = "caps:swapescape";
      variant = "";
    };
  };
}
