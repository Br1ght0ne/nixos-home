{ pkgs, ... }: {
  services.polybar = {
    enable = true;
    package = pkgs.polybarFull;
    # config = {};
    extraConfig = ''
      [colors]
      background = #5a000000
      foreground = #ddffffff
      blight = #b2c312
      bleed = #87040a
      bleed-bright = #cf060f
      ash = #333133
      torch-radiant = #f64a09
      torch-dim = #c13a07
      torch-shadowy = #932c05
      torch-dark = #471503
      torch-pitch = $\{colors.ash}
      heal = #53fa6f

      #######
      # BAR #
      #######

      [bar/external]
      locale = en_US.UTF-8
      monitor = VGA1

      # width = 90%
      height = 28
      # offset-x = 5%
      offset-y = 0
      bottom = false
      fixed-center = true

      background = ''${colors.background}
      foreground = ''${colors.foreground}

      line-size = 2
      line-color = #f00

      modules-left = bspwm date menu
      modules-center = title
      modules-right = keyboard mpd battery brightness
      ; border-size = 5
      ; border-color = #00000000

      padding-left = 0
      padding-right = 0

      module-margin = 1

      font-0 = Iosevka Light:style=Light;0
      font-1 = "Noto Sans CJK JP:style=Regular;0"
      font-2 = "Font Awesome 5 Free:style=Regular:size=12;2"
      font-3 = FontAwesome5Brands:size=12;2
      font-4 = MaterialIcons:size=12;2

      wm-restack = bspwm

      [bar/simple]
      enable-ipc = true
      locale = en_US.UTF-8
      monitor = LVDS-1

      # width = 90%
      height = 28
      # offset-x = 5%
      # offset-y = 0
      bottom = false
      fixed-center = true

      background = ''${colors.background}
      foreground = ''${colors.foreground}

      line-size = 2
      line-color = #f00

      modules-left = bspwm keyboard cmus pulseaudio
      modules-center = date
      modules-right = wireless battery brightness
      ; border-size = 5
      ; border-color = #00000000

      padding-left = 0
      padding-right = 0

      module-margin = 1

      font-0 = Iosevka Light:pixelsize=10;1
      font-1 = "Font Awesome 5 Free:style=Regular:size=11;2"
      font-2 = "Font Awesome 5 Free:style=Solid:size=11;2"
      font-3 = "Font Awesome 5 Brands:style=Regular:size=11;2"
      # font-4 = Noto Sans CJK JP:style=Regular:size=11;2
      font-4 = Source Han Sans JP:style=Regular:size=11;2
      font-5 = MaterialIcons:size=12;2
      tray-position = right
      tray-detached = false
      tray-padding = 6
      tray-maxsize = 16

      wm-restack = bspwm
      scroll-up = bspwm-desknext
      scroll-down = bspwm-deskprev

      [module/wired]
      type = internal/network
      interface = enp2s0
      format-connected = <label-connected>
      format-connected-underline = ''${colors.color2}
      format-disconnected = <label-disconnected>
      format-disconnected-underline = ''${colors.base01}
      label-connected =  %ifname%: %local_ip%  %downspeed%  %upspeed%
      label-disconnected = D

      [module/external_ip]
      type = custom/script
      format-underline = ''${colors.cyan}
      exec = ~/bin/external_ip.sh
      interval = 600

      [module/wireless]
      type = internal/network
      interface = wlp3s0
      format-connected = <label-connected>
      format-disconnected = <label-disconnected>
      format-disconnected-underline = ''${colors.ash}
      label-connected =  %essid%
      format-connected-underline = ''${colors.torch-radiant}
      label-disconnected =  offline

      [module/battery]
      type = internal/battery

      ; This is useful in case the battery never reports 100% charge
      full-at = 99

      #; Use the following command to list batteries and adapters:
      #; $ ls -1 /sys/class/power_supply/
      battery = BAT0
      adapter = AC
      #
      format-charging = <label-charging>
      format-discharging = <label-discharging>
      format-full = <label-full>
      # time-format = "%-H"
      # time-format = "%-H:%{F#92}%M%{F-}"
      time-format = "%-H:%M"

      #
      label-charging = %{F#53fa6f} %percentage%%{F-}
      label-discharging = %{F#87040a}%{F-} %percentage% (%time%)
      label-full = %{F#53fa6f} Crit!%{F-}
      #
      format-discharging-underline = ''${colors.bleed}
      format-charging-underline = ''${colors.heal}
      format-full-underline = ''${colors.heal}

      bar-capacity-width = 5
      bar-capacity-empty =
      bar-capacity-fill = =
      bar-capacity-indicator = >

      format-discharging-padding = 0
      format-charging-padding = 0
      format-full-padding = 0
      #
      ramp-capacity-0 = 
      ramp-capacity-1 = 
      ramp-capacity-2 = 
      ramp-capacity-3 = 
      ramp-capacity-4 = 
      #
      #; Only applies if <animation-charging> is used
      animation-charging-0 = 
      animation-charging-1 = 
      #
      #; Framerate in milliseconds
      animation-charging-framerate = 800

      poll-interval = 20

      [module/date]
      type = internal/date
      interval = 1

      date = %u/%d/%m
      time = %H:%M

      label = %time% | %date%

      format-underline = ''${colors.torch-radiant}

      [module/keyboard]
      type = internal/xkeyboard
      ; List of indicators to ignore
      blacklist-0 = num lock
      blacklist-1 = scroll lock
      blacklist-2 = caps lock
      label-layout = %name%
      label-layout-padding = 0

      format-underline = ''${colors.bleed}

      [settings]
      screenchange-reload = true

      [global/wm]
      margin-top = 0
      margin-bottom = 0

      [module/title]
      type = internal/xwindow
      label-maxlen = 30
      format-underline = ''${colors.ash}
      format-padding = 1

      [module/mpd_color]
      type = internal/mpd

      host = 127.0.0.1
      port = 6600

      # icon-prev = %{F#333133}%{F-}
      # icon-stop = %{F#87040a}%{F-}
      # icon-pause = %{F#f64a09}%{F-}
      # icon-play = %{F#932c05}%{F-}
      # icon-next = %{F#333133}%{F-}
      icon-prev = 
      icon-stop = 
      icon-pause = 
      icon-play = 
      icon-next = 

      format-online = <label-song> %{F#333133}<icon-prev> <toggle> <icon-stop> <icon-next>%{F-}
      # format-online = <label-song> <icon-prev> <toggle> <icon-stop> <icon-next>
      # format-online = <icon-prev> <toggle> <icon-stop> <icon-next>
      # format-online = <label-song>

      label-song = %artist% - %title%
      label-song-maxlen = 70

      format-playing-underline = ''${colors.torch-radiant}
      format-paused-underline = ''${colors.torch-dark}

      format-stopped = stopped
      format-stopped-underline = ''${colors.ash}

      [module/mpd]
      type = internal/mpd

      host = 127.0.0.1
      port = 6600

      icon-prev = 
      icon-stop = 
      icon-pause = 
      icon-play = 
      icon-next = 

      format-online = <label-song> <icon-prev> <toggle> <icon-stop> <icon-next>
      # format-online = <icon-prev> <toggle> <icon-stop> <icon-next>
      # format-online = <label-song>
      format-online-padding = 0

      label-song = %title%
      label-song-maxlen = 30
      label-song-ellipsis = true

      format-playing-underline = ''${colors.heal}
      format-paused-underline = ''${colors.ash}

      format-stopped =  stopped
      format-stopped-underline = ''${colors.bleed}

      [module/pkg]
      type = custom/script
      interval = 60
      format = <label>
      format-underline = ''${colors.color3}
      label = "%output:0:30%"
      exec = ~/bin/pkg.sh
      exec-if = "ping -q -w 2 -c 1 176.34.135.167 > /dev/null"

      [module/filesystem]
      type = internal/fs
      interval = 25

      mount-0 = /
      mount-1 = /tmp
      label-mounted = %{F#0a81f5}%mountpoint%%{F-}: %percentage_used%%
      label-unmounted = %mountpoint% not mounted
      label-unmounted-foreground = ''${colors.foreground-alt}

      [module/pulseaudio]
      type = internal/pulseaudio
      # sink = alsa_output.pci-0000_12_00.3.analog-stereo
      ; Use PA_VOLUME_UI_MAX (~153%) if true, or PA_VOLUME_NORM (100%) if false
      ; Default: true
      use-ui-max = true
      ; Interval for volume increase/decrease (in percent points)
      ; Default: 5
      interval = 5
      format-volume = <ramp-volume> <label-volume>
      label-muted =  muted
      ramp-volume-0 = 
      ramp-volume-1 = 
      ramp-volume-2 = 
      format-volume-underline = ''${colors.torch-radiant}
      format-muted-underline = ''${colors.ash}

      [module/pavolume]
      type = custom/script
      interval = 0.2
      label = %output%
      exec = /home/brightone/.local/bin/pavolume.sh
      click-right = exec pavucontrol
      click-left = ~/bin/pavolume.sh --togmute
      scroll-up = ~/bin/pavolume.sh --up
      scroll-down = ~/bin/pavolume.sh --down

      [module/bspwm]
      type = internal/bspwm
      pin-workspaces = true
      inline-mode = false
      enable-click = true
      enable-scroll = true
      reverse-scroll = true
      fuzzy-match = true
      format = <label-state> <label-mode>

      ws-icon-0 = 一;ichi
      ws-icon-1 = 二;ni
      ws-icon-2 = 三;san
      ws-icon-3 = 四;yon
      ws-icon-4 = 五;go
      ws-icon-5 = 六;roku
      ws-icon-6 = 七;nana
      ws-icon-7 = 八;hachi
      ws-icon-8 = 九;kyū
      ws-icon-9 = 十;jū

      label-focused = %name%
      # label-focused = %name% %icon%
      label-occupied = %name%
      label-urgent = %name%
      label-empty =

      label-focused-padding = 1
      label-occupied-padding = 1
      label-urgent-padding = 1
      label-empty-padding = 1

      label-focused-underline = ''${colors.torch-radiant}
      # label-occupied-underline = ''${colors.ash}
      label-urgent-underline = ''${colors.bleed}

      label-monocle = m
      label-tiled = t
      label-fullscreen = F
      label-floating = f
      label-pseudotiled = T
      label-locked = l
      label-sticky = s
      label-private = p

      label-locked-foreground = ''${colors.bleed-bright}
      label-sticky-foreground = ''${colors.blight}
      label-private-foreground = ''${colors.torch-dim}

      [module/brightness]
      type = internal/backlight
      card = intel_backlight
      format = <ramp>
      label = %percentage%%

      ; Only applies if <ramp> is used
      ramp-0 = %{F#333133}%{F-} Black as Pitch
      ramp-1 = %{F#471503}%{F-} Dark
      ramp-2 = %{F#932c05}%{F-} Shadowy
      ramp-3 = %{F#c13a07}%{F-} Dim Light
      ramp-4 = %{F#f64a09}%{F-} Radiant Light

      ramp-0-underline = ''${colors.torch-pitch}
      ramp-1-underline = ''${colors.torch-dark}
      ramp-2-underline = ''${colors.torch-shadowy}
      ramp-3-underline = ''${colors.torch-dim}
      ramp-4-underline = ''${colors.torch-radiant}

      ramp-0-padding = 0
      ramp-1-padding = 0
      ramp-2-padding = 0
      ramp-3-padding = 0
      ramp-4-padding = 0
      ; Only applies if <bar> is used
      bar-width = 10
      bar-indicator = |
      bar-fill = ─
      bar-empty = ─

      [module/cmus]
      type = custom/script
      interval = 2
      label = %output:0:79%
      exec = ~/.local/bin/music current_polybar
      exec-if = pgrep -x cmus
      click-right = ~/.local/bin/music stop
      click-left = ~/.local/bin/music toggle
      click-middle = ~/.local/bin/music next
      scroll-up = ~/.local/bin/music prev
      scroll-down = ~/.local/bin/music next
    '';
    script = "polybar -r simple &";
  };
}
