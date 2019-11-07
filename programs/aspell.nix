{ pkgs, ... }: {
  home.packages = with pkgs;
    [ aspell ] ++ (with aspellDicts; [ en en-computers ru uk ]);
}
