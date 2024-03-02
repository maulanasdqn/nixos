{
  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "startx";
        user = "ms";
      };
      default_session = initial_session;
    };
  };
}
