{
  programs.waybar = {
    enable = true;
    style = ''
      * {
        border: none;
        font-family: 'Hack Nerd Font', 'Hack Nerd Font Mono';
        font-size: 16px;
        font-feature-settings: '"zero", "ss01", "ss02", "ss03", "ss04", "ss05", "cv31"';
        min-height: 45px;
      }

      window#waybar {
        background: transparent;
      }

      #custom-arch, #workspaces {
        border-radius: 10px;
        background-color: #11111b;
        color: #b4befe;
        margin-top: 15px;
        margin-right: 15px;
        padding-top: 1px;
        padding-left: 10px;
        padding-right: 10px;
      }

      #custom-arch {
        font-size: 20px;
        margin-left: 15px;
        color: #b4befe;
      }

      #workspaces button {
        background: #11111b;
        color: #b4befe;
      }

      #clock, #backlight, #pulseaudio, #bluetooth, #network, #battery{
        border-radius: 10px;
        background-color: #11111b;
        color: #cdd6f4;
        margin-top: 15px;
        padding-left: 10px;
        padding-right: 10px;
        margin-right: 15px;
      }

      #backlight, #bluetooth {
        border-top-right-radius: 0;
        border-bottom-right-radius: 0;
        padding-right: 5px;
        margin-right: 0
      }

      #pulseaudio, #network {
        border-top-left-radius: 0;
        border-bottom-left-radius: 0;
        padding-left: 5px;
      }

      #clock {
        margin-right: 0;
      }
    '';
    settings = {
      mainBar = {
        layer = "top";
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right =
          [ "backlight" "pulseaudio" "bluetooth" "network" "battery" ];

        "hyprland/workspaces" = {
          format = "{name}";
          format-icons = {
            active = "";
            default = "";
          };
          tooltip = false;
          all-outputs = true;
        };

        backlight = {
          device = "intel_backlight";
          format = "<span color='#b4befe'>{icon}</span> {percent}%";
          format-icons = [ "" "" "" "" "" "" "" "" "" ];
        };

        pulseaudio = {
          format = "<span color='#b4befe'>{icon}</span> {volume}%";
          format-muted = "";
          tooltip = false;
          format-icons = {
            headphone = "";
            default = [ "" "" "󰕾" "󰕾" "󰕾" "" "" "" ];
          };
          scroll-step = 1;
        };

        bluetooth = {
          format = "<span color='#b4befe'></span> {status}";
          format-disabled = "";
          format-connected = "<span color='#b4befe'></span> {num_connections}";
          tooltip-format = "{device_enumerate}";
          tooltip-format-enumerate-connected =
            "{device_alias}   {device_address}";
        };

        network = {
          interface = "wlo1";
          format = "{ifname}";
          format-wifi = "<span color='#b4befe'> </span>{essid}";
          format-ethernet = "{ipaddr}/{cidr} ";
          format-disconnected = "<span color='#b4befe'>󰖪 </span>No Network";
          tooltip = false;
        };

        clock = { format = "<span color='#b4befe'> </span>{:%H:%M}"; };

      };
    };
  };
}