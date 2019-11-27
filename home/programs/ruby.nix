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
      let buildLibs = [ libmysqlclient libxml2 openssl sqlite zlib ];
      in (optionals cfg.buildLibs buildLibs)
      ++ (optionals (!cfg.useAsdf) [ ruby ] ++ cfg.extraRubyPackages);
    programs.asdf.toolVersions.ruby = mkIf cfg.useAsdf rubyVersion;
  };
}
