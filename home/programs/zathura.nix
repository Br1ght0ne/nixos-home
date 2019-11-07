{ config, lib, pkgs, ... }:

{
  programs.zathura = {
    enable = true;
    options = {
      statusbar-h-padding = 0;
      statusbar-v-padding = 0;
      selection-clipboard = "clipboard";
      page-padding = 1;
    };
    extraConfig = ''
      map , navigate previous
      map . navigate next
      map <Space> navigate next
      map <S-Space> navigate prev
      map K zoom in
      map J zoom out
      map u scroll half-up
      map d scroll half-down
      map D toggle_page_mode
    '';
  };
}
