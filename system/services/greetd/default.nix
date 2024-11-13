{
  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "Hyprland";
        user = "ms";
      };
      default_session = initial_session;
    };
  };
}
