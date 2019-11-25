{ config, lib, pkgs, ... }:

{
  imports = [
    ../../modules/software/docker.nix
    ../../modules/software/mysql.nix
    ../../modules/software/sway
  ];
}
