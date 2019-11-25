{ config, lib, pkgs, ... }:

{
  imports = [ ../../modules/software/mysql.nix ../../modules/software/sway ];
}
