{ pkgs, ... }:

{
  imports = [ ./cargo.nix ];

  home.packages = with pkgs; [ rustup ];

  programs.zsh.envExtra = ''
    export PATH="$HOME/.cargo/bin:$PATH"
  '';
}
