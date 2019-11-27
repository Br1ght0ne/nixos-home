{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.programs.asdf;
  version = "0.7.5";
  src = pkgs.fetchFromGitHub {
    owner = "asdf-vm";
    repo = "asdf";
    rev = "v${version}";
    sha256 = "0gbxdwqbz0pp3kz4k381cdg4hby31p2d0vq9arfqarz8i58k9ymj";
  };
in {
  options.programs.asdf = {
    enable = mkEnableOption "asdf version manager";
    toolVersions = mkOption {
      default = { };
      type = with types; attrsOf str;
      example = {
        elixir = "1.9.4";
        ruby = "2.6.5";
      };
    };
  };

  config = mkIf cfg.enable {
    home.file = {
      ".tool-versions" = {
        onChange = let
          asdf = "${src}/bin/asdf";
          langToPluginAdd = lang: _version: "${asdf} plugin-add ${lang} || true";
          pluginAdds = mapAttrsToList langToPluginAdd cfg.toolVersions;
        in concatStringsSep "\n"
        (pluginAdds ++ (optional (cfg.toolVersions != { }) "${asdf} install"));
        text = let
          toLine = lang: version: "${lang} ${version}";
          lines = mapAttrsToList toLine cfg.toolVersions;
        in concatStringsSep "\n" lines;
      };
    };
    programs.zsh.initExtra = "source ${src}/asdf.sh";
  };
}
