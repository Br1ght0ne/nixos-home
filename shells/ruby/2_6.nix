{ pkgs ? import <nixpkgs> { }, ... }:
import ./default.nix { rubyPackages = pkgs.rubyPackages_2_6; }
