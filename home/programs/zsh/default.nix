{ pkgs, ... }:

{
  imports = [ ./forgit.nix ];

  home.packages = with pkgs; [ zsh-completions ];

  home.file.".zpreztorc".source = ./zpreztorc;
  home.file.".zsh_completions".source = ./completions;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autocd = true;
    loginExtra = ''
      ssh-add -D
      ssh-add $HOME/.ssh/{blackbird,id_rsa}
    '';
    envExtra = ''
      fpath+=$HOME/.zsh_completions
    '';
    oh-my-zsh = {
      enable = true;
      plugins = [ "docker" "docker-compose" "wd" "z" ];
    };
    plugins = with pkgs; [
      {
        name = "prezto";
        src = fetchFromGitHub {
          owner = "sorin-ionescu";
          repo = "prezto";
          rev = "2d6205e71404704eecc4f402e5b09d7cbd19bab7";
          sha256 = "1ks4vzgh033aw7xr10q1cy6ikmhwz2qbqiqb7056sb0y8kmh86wh";
          fetchSubmodules = true;
        };
        file = "init.zsh";
      }
      rec {
        name = "fast-syntax-highlighting";
        src = fetchFromGitHub {
          owner = "zdharma";
          repo = name;
          rev = "d8e5bbe3dade87216d1a0dddb59a1c148b206e24";
          sha256 = "1na4clk4lcv849gidfn72vp1ycww3pxl41fgkq453i55g9mx2say";
        };
      }
    ];
    shellAliases = {
      ls = "exa --group-directories-first";
      cdr = "cd $(git rev-parse --show-toplevel)";
    };
  };
}
