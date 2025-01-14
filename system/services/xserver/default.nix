{
  services = {
    power-profiles-daemon.enable = false;
    xserver = {
      enable = false;
      displayManager.lightdm.enable = false;
      displayManager.gdm.enable = false;
      desktopManager.gnome.enable = false;
      desktopManager.xfce.enable = false;
      desktopManager.xterm.enable = false;
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
  };
}
