{ pkgs, ... }: {
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url =
        "https://github.com/nix-community/emacs-overlay/archive/395c4a969b19f105ad5c71f096bb4b9e350fd6db.tar.gz";
    }))
  ];

  programs.emacs = {
    enable = true;
    package = pkgs.emacsGit;
  };

  home.file.".doom.d" = {
    source = ./.doom.d;
    recursive = true;
  };
}
