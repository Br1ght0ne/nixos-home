{ config, lib, pkgs, ... }:
with lib;
let cfg = config.programs.nodejs;
in {
  options.programs.nodejs = {
    enable = mkEnableOption "Node.js support";

    yarn = mkOption {
      type = types.submodule {
        options = {
          enable = mkEnableOption "Yarn package manager";

          global = mkOption {
            default = { };
            type = types.submodule {
              options = {
                addToPath = mkOption {
                  default = true;
                  type = types.bool;
                };
              };
            };
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ nodejs ] ++ (optional cfg.yarn.enable yarn);

    programs.zsh.envExtra = with cfg.yarn;
      mkIf (enable && global.addToPath) ''
        export PATH="$HOME/.yarn/bin:$PATH"
      '';
  };
}
