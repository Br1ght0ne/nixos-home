{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.programs.ruby;
  ruby = pkgs.ruby_2_6;
  rubyPackages = pkgs.rubyPackages_2_6;
  rubyVersion = ruby.version.majMinTiny;
in {
  options.programs.ruby = {
    enable = mkEnableOption "Ruby language";
    extraRubyPackages = mkOption {
      default = [ ];
      type = with types; listOf package;
      example = with rubyPackages; [ rspec-core ];
    };
    buildLibs = mkOption {
      default = true;
      type = types.bool;
    };
    useAsdf = mkOption {
      default = false;
      type = types.bool;
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs;
      (optionals (!cfg.useAsdf) [ ruby ])
      ++ (optionals cfg.buildLibs [ libmysqlclient libxml2 ruby sqlite zlib ])
      ++ cfg.extraRubyPackages;
    programs.asdf.toolVersions.ruby = mkIf cfg.useAsdf rubyVersion;
  };
}
