{
  services.sxhkd = {
    enable = true;
    extraConfig = ''
      # sxhkd

      super + Escape
      	pkill -USR1 -x sxhkd

      # apps

      super + Return
          alacritty

      super + {r,s}
          alacritty -e {ranger,dbus-launch cmus}

      super + {e,shift + e}
          {emacs,emacsclient -c}

      super + shift + v
          $HOME/.local/bin/vimedit

      super + b
          $BROWSER

      # environment

      ## layout

      super + {z,x,c,v,shift + z}
      	$HOME/.local/bin/layout {us,ru,ua,dvp,vanilla}

      ## screen

      super + Pause
      	betterlockscreen -l dimblur

      ### brightness

      super + {Home,End}
          light -{A,U} 10
          # brightnessctl s 10%{+,-}

      super + shift + {Home,End}
          light -{A,U} 25

      super + ctrl + Home
          $HOME/.local/bin/rofi-brightness

      ### screenshots

      super + {_,shift} + Print
      	$HOME/.local/bin/maim.sh {_,-s}

      super + shift + {o,s}
          $HOME/.local/bin/toggle-{camera,screencast}

      super + Prior
          $HOME/.local/bin/cliptoqr

      ## rofi

      super + {d,w,ctrl + s,shift + r}
      	rofi -show {drun -m 0,window,ssh,run}

      super + p
      	rofi-pass

      super + {ctrl + m,alt + m,alt + u,shift + m}
          $HOME/.local/bin/mount.sh {ask,mount,umount,_}

      super + shift + p
          $HOME/.local/bin/powersave ask

      super + shift + t
          $HOME/.local/bin/shmile

      ## polybar

      super + shift + b
      	systemctl restart --user polybar

      ## music

      {XF86AudioPrev,XF86AudioPlay,XF86AudioStop,XF86AudioNext}
      	$HOME/.local/bin/music {prev,toggle,stop,next}

      ### cmus-like
      super + alt + {z,x,c,v,b}
          $HOME/.local/bin/music {prev,play,toggle,stop,next}

      super + {Left,Down,Up,Right}
          $HOME/.local/bin/music {prev,toggle,stop,next}

      ## volume

      {XF86AudioRaiseVolume,XF86AudioLowerVolume}
      	(pactl set-sink-volume 0 {+,-}5% || pactl set-sink-volume 0 -- {+,-}5%)

      XF86AudioMute
      	pactl set-sink-mute 0 toggle

      # bspwm hotkeys
      #

      # quit bspwm normally
      super + {alt +,shift +,ctrl +} End
      	{sudo poweroff,bspc quit,lock-suspend}

      # close and kill
      super + {_,shift + }q
      	bspc node -{c,k}

      # monitors
      super + F2
      	$HOME/.local/bin/bspwm-monitor.sh

      # alternate between the tiled and monocle layout
      super + m
      	bspc desktop -l next

      # if the current node is automatic, send it to the last manual, otherwise pull the last leaf
      super + y
      	bspc query -N -n focused.automatic && bspc node -n last.!automatic || bspc node last.leaf -n focused

      # current node and the biggest node
      super + {g, shift + g}
      	bspc node -{f,s} biggest.local

      #
      # state/flags
      #

      # set the window state
      super + {t,shift + f,f}
      	bspc node -t {tiled,floating,fullscreen}

      # set the node flags
      super + ctrl + {z,x,c}
      	bspc node -g {sticky,locked,private}

      #
      # focus/swap
      #

      # focus the node in the given direction
      super + {_,shift + }{h,j,k,l}
      	bspc node -{f,s} {west,south,north,east}

      # focus the node for the given path jump
      super + {p,b,comma,period}
      	bspc node -f @{parent,brother,first,second}

      # focus the next/previous desktop in the current monitor
      super + {_,shift + }bracket{left,right}
      	bspc {desktop -f, node -d} {prev,next}.occupied.local

      # same, but all desktops
      super + ctrl + {_,shift + }bracket{left,right}
      	bspc {desktop -f, node -d} {prev,next}.local

      # focus the last node/desktop
      super + Tab
      	bspc desktop -f last
      super + shift + Tab
          	bspc node -f last.local
      super + {_,shift +}grave
          	bspc {node -f} {prev,next}.local

      # rotate windows

      super + shift + {semicolon,apostrophe}
          bspc node @/ -R {-90,90}

      # swap with last local node
      super + {n,shift + n}
      	bspc node -{f,s} last.local

      # focus the older or newer node in the focus history
      super + {o,i}
      	bspc wm -h off; \
      	bspc node {older,newer} -f; \
      	bspc wm -h on

      # focus or send to the given desktop
      super + {_,shift + }{1-9,0}
      	bspc {desktop -f,node -d} '^{1-9,10}'

      #
      # preselect
      #

      # preselect the direction
      super + ctrl + {h,j,k,l}
      	bspc node -p {west,south,north,east}

      # preselect the ratio
      super + ctrl + {1-9}
      	bspc node -o 0.{1-9}

      # cancel the preselection for the focused node
      super + ctrl + space
      	bspc node -p cancel

      # cancel the preselection for the focused desktop
      super + ctrl + shift + space
      	bspc query -N -d | xargs -I id -n 1 bspc node id -p cancel

      #
      # move/resize
      #

      # expand a window by moving one of its side outward
      super + alt + {h,j,k,l}
      	bspc node -z {left -20 0,bottom 0 20,top 0 -20,right 20 0}

      # contract a window by moving one of its side inward
      super + alt + shift + {h,j,k,l}
      	bspc node -z {right -20 0,top 0 20,bottom 0 -20,left 20 0}

      # move a floating window
      super + {Left,Down,Up,Right}
      	bspc node -v {-20 0,0 20,0 -20,20 0}
    '';
  };
}
