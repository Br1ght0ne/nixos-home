{ pkgs, ... }: {
  home.packages = [ pkgs.rtv ];

  xdg.configFile = {
    "rtv/rtv.cfg".source = ./rtv.cfg;
    "rtv/themes/zenburn.cfg".source = ./themes/zenburn.cfg;
  };
}
