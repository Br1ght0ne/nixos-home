{ config, lib, pkgs, ... }:

{
  home.packages = [ pkgs.fzf ];

  programs.zsh = {
    envExtra = ''
      export FORGIT_NO_ALIASES=1
    '';
    plugins = [{
      name = "forgit";
      src = pkgs.fetchFromGitHub {
        owner = "wfxr";
        repo = "forgit";
        rev = "ade7ca95542f5229d3278ee66ad73f5b47f76082";
        sha256 = "1xwgdd2rw47qk717d8035vfs2kspc4sha04hikz9w6si2x5hfr16";
      };
    }];
    shellAliases = {
      fgl = "forgit::log";
      fgd = "forgit::diff";
      fga = "forgit::add";
      fgrh = "forgit::reset::head";
      fgi = "forgit::ignore";
      fgcf = "forgit::restore";
      fgclean = "forgit::clean";
      fgss = "forgit::stash::show";
    };
  };
}
