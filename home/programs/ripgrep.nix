{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ffmpeg
    pandoc
    poppler_utils
    ripgrep
    ripgrep-all
  ];

  xdg.configFile.ripgrep = {
    target = "ripgrep/config";
    text = ''
      --max-columns=150
      --max-columns-preview
      --type-add
      web:*.{html,css,js}*
      --smart-case
    '';
  };
}
