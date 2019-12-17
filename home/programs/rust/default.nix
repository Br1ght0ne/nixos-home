{ pkgs, ... }:

{
  home.packages = with pkgs; [
    cargo-asm
    cargo-audit
    cargo-bloat
    cargo-deb
    cargo-deps
    cargo-download
    cargo-edit
    cargo-expand
    cargo-flamegraph
    cargo-fuzz
    cargo-geiger
    cargo-generate
    cargo-graph
    cargo-inspect
    cargo-license
    cargo-make
    cargo-outdated
    cargo-release
    cargo-sweep
    cargo-tree
    cargo-udeps
    cargo-update
    cargo-watch
    cargo-web
    cargo-xbuild
    rustup
    sccache
    wasm-pack
  ];

  programs.zsh.envExtra = ''
    export RUSTC_WRAPPER=sccache
    export PATH="$HOME/.cargo/bin:$PATH"
  '';
}
