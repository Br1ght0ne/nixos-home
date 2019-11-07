#!/usr/bin/env zsh

org2pdf() {
    out=`basename $1 .org`
    pandoc -s "$1" -o "${out}.pdf" --pdf-engine=xelatex -V mainfont="Open Sans" -V geometry:margin=1in
}

weechat() {
    env WEECHAT_PASSPHRASE=$(pass show im/local/weechat) weechat
}

lyrics() {
    clear
    beet lyrics -p "$@" | more
}

screc() {
    ffmpeg -video_size 1366x768 -f x11grab -i :0.0 ~/screen.gif &!
}

steamlib32() {
    LD_LIBRARY_PATH=/home/brightone/.local/share/Steam/ubuntu12_32/steam-runtime/i386/usr/lib/i386-linux-gnu:/home/brightone/.local/share/Steam/ubuntu12_32/steam-runtime/i386/lib/i386-linux-gnu:. $@
}

steamlib32clean() {
    LD_LIBRARY_PATH=/home/brightone/.local/share/Steam/ubuntu12_32/steam-runtime/i386/usr/lib/i386-linux-gnu:/home/brightone/.local/share/Steam/ubuntu12_32/steam-runtime/i386/lib/i386-linux-gnu $@
}

steamlib64() {
    LD_LIBRARY_PATH=/home/brightone/.local/share/Steam/ubuntu12_64/steam-runtime/amd64/lib/x86-64-linux-gnu:/home/brightone/.local/share/Steam/ubuntu12_64/steam-runtime/amd64/usr/lib/x86-64-linux-gnu:. $@
}

steamlib64clean() {
    LD_LIBRARY_PATH=/home/brightone/.local/share/Steam/ubuntu12_64/steam-runtime/amd64/lib/x86-64-linux-gnu:/home/brightone/.local/share/Steam/ubuntu12_64/steam-runtime/amd64/usr/lib/x86-64-linux-gnu $@
}

writeiso() {
    sudo dd if="$1" of="$2" status=progress bs=4M oflag=sync
}

mountiso() {
    sudo mount -o loop "$1" /mnt/iso
}

decrypt() {
    $1 <(gpg2 --decrypt $2)
}

dotnet-boot() {
    mkdir $1
    cd $1
    dotnet new sln
    dotnet new $2
    dotnet sln add $1.csproj
}

ranger-cd() {
    [[ -z "$RANGER_LEVEL" ]] || exit

    tempfile="$(mktemp -t tmp.XXXXXX)"
    ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}

rename-screen() {
    fname="$1"
    mv ~/screen.png ~/pics/screenshots/"${fname}".png
}

fcopy() {
    cat $1 | xclip -selection clipboard
}

wine64() {
    WINEARCH=win64 WINEPREFIX=~/.wine64 wine $@
}

pg() {
    ps aux | grep "[${1:0:1}]${1:1}"
}

serveo() {
    ssh -R 80:localhost:${1:-3000} serveo.net
}

git-branch-current() {
    git branch | grep '^\*' | cut -d' ' -f2
}

# Gentoo stuff
alias gfu='sudo emerge -vuND --with-bdeps=y @world && sudo emerge -vc && sudo revdep-rebuild'
alias sync-gfu='sudo eix-sync && gfu'
alias ask-gfu='sudo emerge -avuND --with-bdeps=y @world && sudo emerge -vc && sudo revdep-rebuild'
alias ask-sync-gfu="sudo eix-sync && ask-gfu"
rebuild-kernel() {
    (
        set -e
        JOBS=${NTHREADS:4}

        cd /usr/src/linux
        sudo make oldconfig
        sudo make -j${JOBS}
        sudo make -j${JOBS} modules_install
        sudo make -j${JOBS} install
        sudo grub-mkconfig -o /boot/grub/grub.cfg
        sudo emerge -v @module-rebuild
    )
}

alias cp='cp --reflink=auto'
alias em='emacsclient -a vim -t'
alias emc='emacsclient -c -a vim'
alias tddg="BROWSER=links ddgr"
alias f='ranger-cd'
alias ffsend='docker run --rm -it -v $(pwd):/data timvisee/ffsend'
alias hiber='sudo zzz || sudo systemctl hibernate -i'

if command -v exa &>/dev/null; then
	alias ls='exa'
fi

alias l='ls -1a'
alias lyrics='music lyrics'
alias m='ncmpcpp'
alias mpm='mpv --no-video'
alias news='newsboat'
alias rf='rifle'
alias rss='canto-curses'
alias rtv='RTV_URLVIEWER="urlscan -d -r \"urlopen {}\"" rtv --enable-media'
alias q='qutebrowser'
alias se='sudo emacsclient -a vim -t'
alias sec='sudo emacsclient -c -a vim'
alias ts='trans -t'
alias unmerge='sudo emerge --unmerge'
alias z='zathura'
alias X='startx'

# Ruby
alias rac='bundle exec rails console'
alias bu='bundle'
alias bue='bundle exec'
alias bus='bundle exec rspec'

# Antibody
alias abu='antibody bundle < ~/.zsh/plugins.txt >| ~/.zsh/plugins.zsh'

# Docker
alias dce='docker-compose exec'
alias dcu='docker-compose up -d'
docker-sh() {
    docker run -w /src -v $(pwd):/src --rm "$1" ${@:2}
}

# Exercism
ex-test() {
    language=$(cd .. && basename $(pwd))
    image=${$(sed -n "/${language}:/{n;p;}" ../../.gitlab-ci.yml | awk '{print $2}')}
    docker-sh "$image" $@
}

# Projects
cdr() {
    local root

    if root=$(git rev-parse --show-toplevel); then
        cd "$root"
    fi
}

# Crystal
alias cr="crystal"
