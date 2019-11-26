{ pkgs, ... }:

{
  programs = {
    firefox = {
      enable = true;
      package = pkgs.firefox-wayland;
      profiles.default = {
        settings = {
          "browser.startup.homepage" = "https://zombiefox.github.io/nightTab/";
          "browser.search.defaultenginename" = "duckduckgo";
        };
        userChrome = ''
          #tabbrowser-tabs {
            visibility: collapse !important;
          }

          #sidebar-header {
            display: none;
          }
        '';
      };
    };
    zsh.sessionVariables.BROWSER = "firefox";
  };
}
