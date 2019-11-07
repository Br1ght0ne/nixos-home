{
  programs.firefox = {
    enable = true;
    profiles.default = {
      settings = {
        "browser.startup.homepage" = "https://zombiefox.github.io/nightTab/";
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
}
