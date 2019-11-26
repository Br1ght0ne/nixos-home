{ lib, pkgs, ... }:

{
  config.services.mysql.package = lib.mkDefault pkgs.mysql;
}
