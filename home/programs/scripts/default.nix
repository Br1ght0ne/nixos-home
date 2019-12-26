{ pkgs, ... }:

{
  home.packages = with pkgs; [ xdg_utils ];

  home.file."bin" = {
    source = ./bin;
    recursive = true;
  };
}
