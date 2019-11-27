{ pkgs, ... }:

with builtins;

{
  nixpkgs.overlays = let
    repo = "https://github.com/nix-community/emacs-overlay";
    commit = "b9392598363bd37af6ed9fbc7d5373fa811fdcc9";
  in [ (import (fetchTarball { url = "${repo}/archive/${commit}.tar.gz"; })) ];

  programs = {
    emacs = {
      enable = true;
      package = pkgs.emacsGit;
    };
    zsh.sessionVariables.EDITOR = "emacs";
  };

  home.file.".doom.d" = {
    source = ./.doom.d;
    recursive = true;
  };
}
