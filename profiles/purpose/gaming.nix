{ lib, ... }:

{
  nixpkgs.config.allowUnfree = true;
  services.zerotierone = {
    enable = lib.mkDefault true;
    joinNetworks = [
      "d3ecf5726df307e4" # games
    ];
  };
}
