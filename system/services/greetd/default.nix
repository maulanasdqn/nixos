{
  services.greetd = {
    enable = false;
    settings = rec {
      initial_session = {
        command = "Hyprland";
        user = "ms";
      };
      default_session = initial_session;
    };
  };
}
