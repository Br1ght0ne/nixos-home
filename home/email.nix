{ pkgs, ... }: {
  home.packages = with pkgs; [ mu ];

  programs.mbsync.enable = true;

  accounts.email.accounts = let
    office365 = {
      imap = {
        host = "outlook.office365.com";
        port = 993;
      };
      smtp = {
        host = "smtp.office365.com";
        port = 587;
        tls.useStartTls = true;
      };
    };
  in {
    blackbird-lab = rec {
      realName = "Oleksii Filonenko";
      address = "ofilonenko@blackbird-lab.com";
      userName = address;
      primary = true;
      mbsync = {
        enable = true;
        create = "maildir";
        expunge = "both";
      };
      passwordCommand = "gopass work/blackbird/mail";
    } // office365;
  };
}
