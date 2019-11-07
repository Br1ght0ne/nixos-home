{ pkgs, ... }:

{
  imports = [
    ./config.nix
    ./email.nix
    ./packages.nix
    ./programs
    ./services
    ./themes.nix
  ];
}
