{ pkgs, ... }:

{
  home.packages = with pkgs.gitAndTools; [ bfg-repo-cleaner delta git-standup hub ];

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
    enable = true;
    extraConfig = {
      core = {
        pager = "delta --dark";
      };
    };
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
      github.user = "filalex77";
    };
  };
}
