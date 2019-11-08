{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [ cmus cmusfm ];

  xdg.configFile."cmus/rc".source = ./rc;
}
