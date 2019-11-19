{ pkgs, ... }: {
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url =
        "https://github.com/nix-community/emacs-overlay/archive/29f935f0e15c5a74051ac01731c01516cdfde3a8.tar.gz";
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
