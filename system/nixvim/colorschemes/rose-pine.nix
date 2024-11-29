{...}: {
  rose-pine = {
    enable = true;
    settings = {
      dark_variant = "main";
      dim_inactive_windows = true;
      enable = {
        legacy_highlights = false;
        migrations = true;
        terminal = true;
      };
      extend_background_behind_borders = false;
      groups = {
        border = "muted";
        link = "iris";
        panel = "surface";
        error = "love";
        hint = "iris";
        info = "foam";
        warn = "gold";
      };
      styles = {
        bold = true;
        italic = true;
        transparency = true;
      };
    };
  };
}
