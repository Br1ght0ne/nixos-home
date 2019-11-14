{ pkgs, ... }:

{
  imports = [ ./cargo.nix ];

  home.packages = with pkgs; [ rustup ];
}
