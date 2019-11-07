{ pkgs, ... }: {
  home.packages = with pkgs;
    let myAspell = (aspellWithDicts (d: with d; [ en ru uk ]));
    in [ myAspell ];
}
