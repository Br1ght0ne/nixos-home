{
  # REVIEW: make things like `guard listen` work better
  boot.kernel.sysctl."fs.inotify.max_user_watches" = 524288;

  programs.sway = {
    enable = true;
    enableQtwayland = true;
    enableXwayland = true;
  };

  services = {
    docker.enable = true;
    mysql.enable = true;
  };
}
