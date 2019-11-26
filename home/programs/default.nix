{ pkgs, ... }: {
  imports = [
    ./alacritty.nix
    ./asdf.nix
    ./aspell.nix
    ./beets.nix
    ./cmus
    ./emacs
    ./firefox.nix
    ./git.nix
    ./home-manager.nix
    ./jetbrains.nix
    ./keybase.nix
    ./mpv.nix
    ./next.nix
    ./ranger
    ./ripgrep.nix
    ./rofi
    ./rofi-pass.nix
    ./rtv
    ./ruby.nix
    ./rust
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
    go.enable = true;
    gpg.enable = true;
    htop.enable = true;
    jq.enable = true;
    kakoune.enable = true;
    skim.enable = true;
    starship = {
      enable = true;
      settings = { };
    };
    vim.enable = true;
  };
}
