{ pkgs, ... }:

{
  home-manager.users.brightone = {
    xdg.configFile."i3statusbar.toml".source = ./.config/i3statusbar.toml;
  };
  programs.sway.extraPackages = with pkgs; [ i3status-rust ];
}
