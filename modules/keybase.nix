{ pkgs, ... }:

{
  home-manager.users.brightone = {
    home.packages = with pkgs; [ keybase-gui ];
    services = {
      kbfs.enable = true;
      keybase.enable = true;
    };
  };
}
