{ pkgs, ... }: {
  imports = [
    ./alacritty.nix
    ./aspell.nix
    ./beets.nix
    ./cmus
    ./emacs
    ./firefox.nix
    ./git.nix
    ./home-manager.nix
    ./mpv.nix
    ./ranger
    ./ripgrep.nix
    ./rofi
    ./rofi-pass.nix
    ./rtv
    ./scripts
    ./topgrade.nix
    ./zathura.nix
    ./zsh
  ];

  programs = {
    bash.enable = true;
    bat.enable = true;
    broot.enable = true;
    command-not-found.enable = true;
    direnv.enable = true;
    feh.enable = true;
    go.enable = true;
    gpg.enable = true;
    htop.enable = true;
    jq.enable = true;
    kakoune.enable = true;
    skim.enable = true;
    vim.enable = true;
  };
}
