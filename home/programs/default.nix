{ config, pkgs, ... }: {
  imports = [
    ./alacritty.nix
    ./asdf.nix
    ./aspell.nix
    ./beets.nix
    ./borgbackup.nix
    ./cmus
    ./crystal.nix
    ./emacs
    ./firefox.nix
    ./git.nix
    ./home-manager.nix
    ./jetbrains.nix
    ./keybase.nix
    ./mpv.nix
    ./next.nix
    ./nodejs.nix
    ./ranger
    ./ripgrep.nix
    ./rofi
    ./rofi-pass.nix
    ./rtv
    ./ruby.nix
    ./rust
    ./scripts
    ./topgrade.nix
    ./waybar
    ./zathura.nix
    ./zsh
  ];

  programs = {
    bash.enable = true;
    bat.enable = true;
    broot.enable = true;
    chromium = {
      enable = true;
      extensions = [
        "gcbommkclmclpchllfjekcdonpmejbdp" # HTTPS Everywhere
        "cjpalhdlnbpafiamejdnhcphjbkeiagm" # uBlock Origin
      ];
    };
    command-not-found.enable = true;
    direnv = {
      enable = true;
      config = {
        whitelist = {
          prefix = [ "${config.home.homeDirectory}/dev" ];
          exact = [ "/etc/nixos" ];
        };
      };
    };
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
