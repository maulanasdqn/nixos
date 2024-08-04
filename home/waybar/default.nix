{pkgs, ...}: {
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    settings = {
      mainBar = {
        layer = "top";
        margin = "12 12 0 12";
        "modules-left" = ["custom/arch" "hyprland/workspaces"];
        "modules-center" = ["clock"];
        "modules-right" = ["backlight" "pulseaudio" "bluetooth" "network" "battery"];

        "custom/arch" = {
          format = "";
          tooltip = false;
          "on-click" = "wofi --show drun";
        };

        "hyprland/workspaces" = {
          format = "{icon}";
          tooltip = false;
          "all-outputs" = true;
          "format-icons" = {
            active = "";
            default = "";
          };
        };

        clock = {
          format = "<span color='#ebbcba'> </span>{:%H:%M}";
        };

        backlight = {
          device = "intel_backlight";
          format = "<span color='#b4befe'>{icon}</span> {percent}%";
          "format-icons" = ["" "" "" "" "" "" "" "" ""];
        };

        pulseaudio = {
          format = "<span color='#ebbcba'>{icon}</span> {volume}%";
          "format-muted" = "";
          tooltip = false;
          "format-icons" = {
            headphone = "";
            default = ["" "" "󰕾" "󰕾" "󰕾" "" "" ""];
          };
          "scroll-step" = 1;
        };

        bluetooth = {
          format = "<span color='#ebbcba'></span> {status}";
          "format-disabled" = "";
          "format-connected" = "<span color='#b4befe'></span> {num_connections}";
          "tooltip-format" = "{device_enumerate}";
          "tooltip-format-enumerate-connected" = "{device_alias}   {device_address}";
        };

        network = {
          interface = "enp4s0";
          format = "{ifname}";
          "format-wifi" = "<span color='#ebbcba'> </span>{essid}";
          "format-ethernet" = "{ipaddr}/{cidr} ";
          "format-disconnected" = "<span color='#b4befe'>󰖪 </span>No Network";
          tooltip = false;
        };

        tray = {
          spacing = 5;
        };

        battery = {
          format = "<span color='#ebbcba'>{icon}</span> {capacity}%";
          "format-icons" = ["" "" "" "" "" "" "" "" "" ""];
          "format-charging" = "<span color='#b4befe'></span> {capacity}%";
          tooltip = false;
        };
      };
    };

    style = ''
      * {
        border: none;
        font-family: "Hack Nerd Font Mono", "Hack Nerd Font";
        font-size: 14px;
        min-height: 25px;
      }

      window#waybar {
        border-radius: 6px;
        background: #1f1d2e;
      }

      #custom-arch,
      #workspaces {
        background-color: #1f1d2e;
        color: #ebbcba;
        margin-right: 15px;
        padding-left: 10px;
        padding-right: 10px;
      }

      #custom-arch {
        margin-left: 15px;
        color: #ebbcba;
      }

      #workspaces button {
        background: #1f1d2e;
        color: #ebbcba;
      }

      #clock,
      #backlight,
      #pulseaudio,
      #bluetooth,
      #network,
      #battery {
        background-color: #1f1d2e;
        color: #ebbcba;
        padding-left: 10px;
        padding-right: 10px;
        margin-right: 15px;
      }

      #backlight,
      #bluetooth {
        padding-right: 5px;
        margin-right: 0;
      }

      #network {
        padding-left: 5px;
      }

      #clock {
        margin-right: 0;
      }
    '';
  };
}
