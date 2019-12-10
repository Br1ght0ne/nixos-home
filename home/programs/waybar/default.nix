{ config, lib, pkgs, ... }:
with lib;
let cfg = config.programs.waybar;
in {
  options.programs.waybar = {
    enable = mkEnableOption "Waybar";

    config = mkOption {
      type = types.attrs;
      default = {
        layer = "top";
        position = "top";
        height = 30;
        modules-left = [ "sway/workspaces" "sway/mode" "sway/window" ];
        modules-center = [ ];
        modules-right = [
          "network"
          "battery"
          "backlight"
          "pulseaudio"
          "cpu"
          "idle_inhibitor"
          "clock"
          "tray"
        ];
        "sway/mode" = {
          tooltip = false;
          format = ''<span weight="bold">{}</span>'';
        };
        "sway/window" = {
          tooltip = false;
          max-length = 50;
        };
        network = {
          tooltip = false;
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "{ifname}: {ipaddr}/{cidr}";
          format-linked = "{ifname} (No IP)";
          format-alt = "{ifname}: {ipaddr}";
          format-disconnected = "No internet";
        };
        battery = {
          format = "{capacity}% {icon}";
          states = {
            warning = 30;
            critical = 15;
          };
          format-icons = [ "" "" "" "" ];
        };
        backlight = {
          format = "{percent}% {icon}";
          format-icons = [ "" "" "" ];
        };
        pulseaudio = {
          tooltip = false;
          format = "{volume}% {icon}";
          format-bluetooth = "{volume}% {icon}";
          format-muted = "";
          format-source = "{volume}%";
          format-source-muted = "";
          format-icons = {
            headphones = "";
            handsfree = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [ "" "" "" ];
          };
          on-click = "pavucontrol";
        };
        cpu = {
          interval = 8;
          tooltip = false;
          format = "{usage}% ";
        };
        idle_inhibitor = {
          tooltip = false;
          format = "{icon}";
          format-icons = {
            activated = " spotted";
            deactivated = " hidden";
          };
        };
        clock = {
          tooltip = false;
          format = "{:%a, %d %b %H:%M}";
        };
        tray = {
          tooltip = false;
          spacing = 10;
        };
      };
      example = {
        layer = "top";
        modules-right = [ "network" "clock" ];
        clock = {
          tooltip = false;
          format = "{:%a, %d %b %H:%M}";
        };
      };
    };

    stylePath = mkOption {
      type = types.path;
      default = ./.config/waybar/style.css;
    };
  };

  config = mkIf cfg.enable {
    xdg.configFile."waybar/config".text = generators.toJSON { } cfg.config;
    xdg.configFile."waybar/style.css".source = cfg.stylePath;
  };
}
