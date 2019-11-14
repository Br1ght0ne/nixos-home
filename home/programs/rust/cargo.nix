{ pkgs, ... }:

{
  home.packages = with pkgs; [ cargo-release ];
}
