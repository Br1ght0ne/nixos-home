{
  programs.alacritty = {
    enable = true;
    settings = {
      background_opacity = 0.8;
      window.padding = {
        x = 2;
        y = 2;
      };
      font = {
        normal.family = "FuraCode Nerd Font";
        size = 8.0;
      };
      colors = {
        primary = {
          background = "0x282828";
          foreground = "0xd5c4a1";
        };
        normal = {
          black = "0x000000";
          red = "0xd54e53";
          green = "0xb9ca4a";
          yellow = "0xe6c547";
          blue = "0x7aa6da";
          magenta = "0xc397d8";
          cyan = "0x70c0ba";
          white = "0xeaeaea";
        };
        bright = {
          black = "0x666666";
          red = "0xff3334";
          green = "0x9ec400";
          yellow = "0xe7c547";
          blue = "0x7aa6da";
          magenta = "0xb77ee0";
          cyan = "0x54ced6";
          white = "0xffffff";
        };
      };
      mouse.url.launcher = ~/.local/bin/url-handler;
    };
  };
}
