{
  imports = [
    ./hardware/squashfs.nix
    ./programs/cachix.nix
    ./programs/sway
    ./services/docker.nix
    ./services/hercules-ci.nix
    ./services/mysql.nix
  ];
}
