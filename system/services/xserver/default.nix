{
  services.xserver = {
    enable = true;
    videoDrivers = [ "amdgpu" ];
    xkb = {
      layout = "us";
      options = "caps:swapescape";
      variant = "";
    };
  };
}
