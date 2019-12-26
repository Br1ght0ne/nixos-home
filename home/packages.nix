{ pkgs, ... }:

{
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = let rev = "991ed616bdd405f3f88ff4cad08985911ff52fff";
      in "https://github.com/filalex77/nixpkgs-overlay/archive/${rev}.tar.gz";
    }))
  ];

  home.packages = with pkgs;
    let
      myEmacs = (emacs.override {
        withGTK3 = true;
        withGTK2 = false;
      });
      steamWithLibs =
        (steam.override { extraPkgs = pkgs: [ libjpeg openssl_1_0_2 ]; });
      steam-run = (steamWithLibs.override { nativeOnly = true; }).run;
    in [
      # development
      crystal
      editorconfig-core-c
      elixir
      exercism
      gdb
      insomnia
      ix
      lua
      nasm
      nim
      python3Packages.nvchecker
      python3
      ruby
      shellcheck
      shfmt
      stack
      wakatime
      zig

      # nix stuff
      nixfmt
      nix-diff
      nix-index
      nix-prefetch-github
      nixpkgs-review
      patchelf

      # documents
      gimp
      # gimp-with-plugins (broken)
      libreoffice-fresh

      # other ART (Awesome Rust Tools)
      exa
      diskus
      du-dust
      fd
      hexyl
      hyperfine
      just
      lsd
      pastel
      ruplacer
      sd
      tealdeer
      tokei
      websocat
      xsv
      zola

      # communication
      discord
      riot-desktop
      slack
      tdesktop
      weechat
      zoom-us

      # gaming software
      steamWithLibs
      steam-run
      wineFull
      winetricks

      # games
      cataclysm-dda-git

      # monitoring
      inxi
      neofetch
      python3Packages.glances
      speedtest-cli

      # passwords & security
      gopass
      pass
      tor-browser-bundle-bin

      # net & cloud tools
      doctl
      httpie
      miniserve
      rclone
      transmission-gtk

      # synchronization
      borgbackup
      syncthing-gtk

      # entertainment
      epr
      python3Packages.mps-youtube
      youtube-dl

      # my stuff
      swaylayout
    ];
}
