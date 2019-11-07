{ pkgs, ... }:

{
  programs.mpv = {
    enable = true;
    bindings = {
      "h" = "seek -5";
      "H" = "seek -15";
      "Ctrl+h" = "seek -60";
      "Ctrl+H" = "seek -300";
      "l" = "seek 5";
      "L" = "seek 15";
      "Ctrl+l" = "seek 60";
      "Ctrl+L" = "seek 300";
      "y" = "show_text \${media-title}";
      "Y" = "show_text \${playlist}";
      "D" = "playlist-remove current";
      "C" = "playlist-clear";
      "n" = "add chapter 1";
      "N" = "add chapter -1 ";
    };
    config = {
      ytdl-format = "bestvideo[height<=?1080]+bestaudio/best";
      sub-auto = "all";
    };
    profiles = {
      "extension.gif".loop-file = true;
      "extension.gifv".loop-file = true;
      "extension.webm".loop-file = true;
    };
  };
}
