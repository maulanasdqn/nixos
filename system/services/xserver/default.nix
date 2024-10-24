{
  services.xserver = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    enable = true;
    synaptics = {
      enable = false;
    };
    videoDrivers = ["amdgpu"];
    xkb = {
      layout = "us";
      options = "caps:swapescape";
      variant = "";
    };
  };
}
