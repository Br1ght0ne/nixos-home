{ pkgs, ... }:

{
  programs.zsh.envExtra = ''
    export BORG_PASSCOMMAND="pass show borgbackup"
    export BORG_REPO="19362@ch-s012.rsync.net:backups"
    export BORG_REMOTE_PATH=borg1
  '';
}
