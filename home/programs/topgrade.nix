{ config, lib, pkgs, ... }:

with lib;
let cfg = config.programs.topgrade;
in {
  options.programs.topgrade = {
    enable = mkEnableOption "topgrade";

    config = mkOption {
      default = { };
      example = {
        git_repos = [ "~/.emacs.d" ];
        disable = [ "emacs" "gem" ];
      };
    };
  };

  config = {
    home.packages = with pkgs;
      [ topgrade ]
      ++ (optional (attrByPath [ "run_in_tmux" ] false cfg.config) tmux);

    # TODO: lib.generators.toTOML would be *so* nice!
    # xdg.configFile."topgrade.toml".text = lib.generators.toTOML { } cfg.config;
  };
}
