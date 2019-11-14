{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autocd = true;
    plugins = with pkgs;
      let
        prezto = fetchFromGitHub {
          owner = "sorin-ionescu";
          repo = "prezto";
          rev = "2d6205e71404704eecc4f402e5b09d7cbd19bab7";
          sha256 = "1ks4vzgh033aw7xr10q1cy6ikmhwz2qbqiqb7056sb0y8kmh86wh";
          fetchSubmodules = true;
        };
        preztoModule = module: {
          name = "prezto-${module}";
          src = "${prezto}/modules/${module}";
          file = "init.zsh";
        };
      in [
        {
          name = "prezto";
          src = prezto;
          file = "init.zsh";
        }
        rec {
          name = "fast-syntax-highlighting";
          src = fetchFromGitHub {
            owner = "zdharma";
            repo = name;
            rev = "d8e5bbe3dade87216d1a0dddb59a1c148b206e24";
            sha256 = "1ks4vzgh033aw7xr10q1cy6ikmhwz2qbqiqb7056sb0y8kmh86wh";
          };
        }
      ] ++ map preztoModule [
        "utility"
        "completion"
        "history-substring-search"
        "docker"
        "git"
      ];
  };
}
