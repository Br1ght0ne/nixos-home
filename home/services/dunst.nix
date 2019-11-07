{ pkgs, ... }: {
  services.dunst = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    settings = {
      global = {
        font = "Iosevka 11";
        markup = true;
        format = ''
          %s
          %b
        '';
        sort = true;
        indicate_hidden = true;
        alignment = "center";
        word_wrap = true;
        stack_duplicates = true;
        hide_duplicates_count = false;
        geometry = "300x50-15+49";
        shrink = true;
        transparency = 20;
        follow = "none";
        show_indicators = false;
        separator_height = 0;
        padding = 15;
        horizontal_padding = 15;
        separator_color = "frame";
        startup_notification = false;
        dmenu = "rofi -dmenu -p dunst";
        frame_width = 2;
        frame_color = "#b2c312";
      };
      shortcuts = {
        close = "mod4+space";
        close_all = "mod4+shift+space";
        context = "mod4+shift+f";
        history = "mod4+shift+d";
      };
      # urgencies
      urgency_low = {
        frame_color = "#333133";
        foreground = "#ffffff";
        background = "#000000";
        timeout = 2;
      };
      urgency_normal = {
        frame_color = "#b2c312";
        foreground = "#ffffff";
        background = "#000000";
        timeout = 6;
      };
      urgency_critical = {
        frame_color = "#f64a09";
        foreground = "#ffffff";
        background = "#000000";
        timeout = 20;
      };
      # apps
      cmusfm = {
        appname = "cmusfm";
        urgency = "low";
        timeout = 2;
      };
    };
  };
}
