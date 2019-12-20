{ config, lib, pkgs, ... }:
with lib;
let cfg = config.programs.git;
in {
  options.programs.git = {
    pager = mkOption {
      type = with types; (nullOr (enum [ "delta" "diff-so-fancy" ]));
      default = null;
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs.gitAndTools;
      ([ bfg-repo-cleaner git-standup hub ]
        ++ (optional (cfg.pager == "delta") delta)
        ++ (optional (cfg.pager == "diff-so-fancy") diff-so-fancy));

    home.file.gitignore = {
      target = ".gitignore";
      text = ''
        .config/cmus/playlists
        .config/cmusfm/cmusfm.conf
        .config/hub
        .config/mimeapps.list
        .config/mpv/watch_later/
        .config/mpv/watch_later/
        .config/mpv/scripts/
        .config/ranger/bookmarks

        .zsh/.completions
        .zsh/plugins.zsh
        .weechat/**/*.log
        .yadm/boostrap.retry
      '';
    };

    programs.git = {
      aliases = {
        mr = ''
          !sh -c 'git fetch $1 merge-requests/$2/head:mr-$1-$2 && git checkout mr-$1-$2' -
        '';
        up = "pull --rebase --autostash";
      };
      signing = {
        key = "F5493B7F93725578FDD3D0B8A1BC8428323ECFE8";
        signByDefault = true;
      };
      userName = "Oleksii Filonenko";
      userEmail = "brightone@protonmail.com";
      extraConfig = {
        core.pager = if (cfg.pager == "delta") then
          "delta --dark"
        else if (cfg.pager == "diff-so-fancy") then
          "diff-so-fancy | less --tabs=4 -RFX"
        else
          null;
        github.user = "filalex77";
      };
    };
  };
}
