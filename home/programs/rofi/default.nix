{ pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    theme = "DarkestDungeon";
  };

  xdg.dataFile."rofi/themes/DarkestDungeon.rasi".source = ./DarkestDungeon.rasi;
}
