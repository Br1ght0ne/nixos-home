{ pkgs, ... }:

{
  home.packages = with pkgs.jetbrains; [ ruby-mine ];
}
