{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    # still works, but faster
    enableCompletion = false;
    autocd = true;
    initExtraBeforeCompInit = ''
      fpath+="$HOME/.zsh/completions"
    '';
    initExtra = ''
      export ZDOTDIR=$HOME/.zsh
      . $ZDOTDIR/env.zsh
      [[ -f $ZDOTDIR/plugins.zsh ]] || antibody bundle <$ZDOTDIR/plugins.txt >$ZDOTDIR/plugins.zsh
      . $ZDOTDIR/plugins.zsh
      . $ZDOTDIR/plugins-config.zsh
      . $ZDOTDIR/aliases.zsh
      . $ZDOTDIR/bindings.zsh
      . $ZDOTDIR/theme.zsh
    '';
  };

  home.file.".zsh" = {
    source = ./.zsh;
    recursive = true;
  };
}
