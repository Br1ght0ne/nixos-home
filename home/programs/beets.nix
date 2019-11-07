{
  programs.beets = {
    enable = true;
    settings = {
      directory = "~/music";
      library = "~/.config/beets/library.yaml";
      plugins = "fetchart lyrics convert duplicates";
    };
  };
}
