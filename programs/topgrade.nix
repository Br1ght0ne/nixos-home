{ config, lib, pkgs, ... }:

{
  # TODO: home.packages = [ pkgs.topgrade ];

  xdg.configFile."topgrade.toml".text = ''
    git_repos = ["~/.emacs.d/"]
    disable = ["emacs", "gem", "nix"]

    [commands]
    "gopass" = "gopass sync"
  '';
}
