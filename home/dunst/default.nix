{pkgs, ...}: {
  home.packages = with pkgs; [dunst];
  services.dunst = {
    enable = true;
    settings = {
      global = {
        origin = "top-right";
        offset = "60x12";
        separator_height = 2;
        padding = 12;
        horizontal_padding = 12;
        text_icon_padding = 12;
        frame_width = 4;
        separator_color = "frame";
        idle_threshold = 120;
        font = "Hack Nerd Font Mono 12";
        line_height = 0;
        format = ''
          <b>%s</b>
          %b'';
        alignment = "center";
        icon_position = "off";
        startup_notification = "false";
        corner_radius = 12;
        frame_color = "#524f67"; # Rose Pine's muted gray
        background = "#191724"; # Rose Pine's background
        foreground = "#e0def4"; # Rose Pine's text color
        timeout = 2;
      };
    };
  };
}
