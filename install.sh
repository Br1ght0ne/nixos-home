sudo -i

nix-channel --add https://github.com/rycee/home-manager/archive/master.tar.gz home-manager
nix-channel --update

nix-shell -p git --run git clone https://github.com/filalex77/nixos-home.git /etc/nixos

ln -s "/etc/nixos/hosts/${HOST}/configuration.nix" /etc/nixos/host-configuration.nix

nixos-rebuild switch

exit
