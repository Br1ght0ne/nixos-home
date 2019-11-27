sudo -i

nix-channel --add https://github.com/rycee/home-manager/archive/master.tar.gz home-manager
nix-channel --update

nix-shell -p git --run git clone https://github.com/filalex77/nixos-home.git /etc/nixos

ln -s "/etc/nixos/machines/${HOST}/configuration.nix" /etc/nixos/machine-configuration.nix

nixos-rebuild switch

exit
