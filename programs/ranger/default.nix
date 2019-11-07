{ pkgs, ... }: {
  home.packages = [ pkgs.ranger ];

  xdg.configFile = {
    "ranger/rc.conf".source = ./rc.conf;
    "ranger/rifle.conf".source = ./rifle.conf;
  };
}
