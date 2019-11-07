{ pkgs, ... }: {
  imports = [
    ./alacritty.nix
    ./aspell.nix
    ./beets.nix
    ./cmus.nix
    ./emacs
    ./firefox.nix
    ./git.nix
    ./home-manager.nix
    ./mpv.nix
    ./ranger
    ./ripgrep.nix
    ./rofi-pass.nix
    ./rtv
    ./topgrade.nix
    ./zathura.nix
    ./zsh
  ];

  programs = {
    bash.enable = true;
    broot.enable = true;
    command-not-found.enable = true;
    direnv.enable = true;
    feh.enable = true;
    go.enable = true;
    gpg.enable = true;
    htop.enable = true;
    jq.enable = true;
    kakoune.enable = true;
    rofi = {
      enable = true;
      theme = "DarkestDungeon";
    };
    skim.enable = true;
    vim.enable = true;
  };
}
