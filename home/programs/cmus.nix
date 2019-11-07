{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [ cmus cmusfm ];

  xdg.configFile.cmus = {
    target = "cmus/rc";
    text = ''
      colorscheme gruvbox
      set format_trackwin= %t%= %d (%X)
      set format_trackwin_va= %t (%a)%= %d (%X)
      set altformat_current= %F
      set altformat_playlist= %f%= %d
      set altformat_title=%f
      set altformat_trackwin= %f%= %d
      set display_artist_sort_name=false
      set format_current= %a - %l -%3n. %t%= %y
      set format_playlist= %-20%a %-20%l %3n. %t%= %y %d %{?X!=0?%3X ?    }
      set format_playlist_va= %-20%a %-20%l %3n. %t %= %y %d %{?X!=0?%3X ?    }
      set format_statusline= %{status} %{?show_playback_position?%{position} %{?duration?/ %{duration} }?%{?duration?%{duration} }}- %{total} %{?volume>=0?vol: %{?lvolume!=rvolume?%{lvolume},%{rvolume} ?%{volume} }}%{?stream?buf: %{buffer} }%{?show_current_bitrate & bitrate>=0? %{bitrate} kbps }%=%{?repeat_current?repeat current?%{?play_library?%{playlist_mode} from %{?play_sorted?sorted }library?playlist}} | %1{continue}%1{follow}%1{repeat}%1{shuffle}
      set format_title=%a - %l - %t (%y)
      set format_trackwin= %t%= %d (%X)
      set format_trackwin_album= %l (%y)
      set format_trackwin_va= %t (%a)%= %d (%X)
      set format_treewin=  %l (%y)
      set format_treewin_artist=%a
      set mouse=true
      set mpris=true
      set output_plugin=pulse
      set replaygain=disabled
      set softvol=false
      set status_display_program=cmusfm
      bind -f browser backspace browser-up
      bind -f browser i toggle show_hidden
      bind -f browser space win-activate
      bind -f browser u win-update
      bind -f common ! push shell
      bind -f common + vol +10%
      bind -f common , seek -1m
      bind -f common - vol -10%
      bind -f common . seek +1m
      bind -f common / search-start
      bind -f common 1 view tree
      bind -f common 2 view sorted
      bind -f common 3 view playlist
      bind -f common 4 view queue
      bind -f common 5 view browser
      bind -f common 6 view filters
      bind -f common 7 view settings
      bind -f common = vol +10%
      bind -f common ? search-b-start
      bind -f common C toggle continue
      bind -f common D win-remove
      bind -f common E win-add-Q
      bind -f common F push filter
      bind -f common G win-bottom
      bind -f common I echo {}
      bind -f common L push live-filter
      bind -f common M toggle play_library
      bind -f common N search-prev
      bind -f common P win-mv-before
      bind -f common Q quit
      bind -f common R push clear -
      bind -f common S shell sleep-timer
      bind -f common U win-update-cache
      bind -f common V invert
      bind -f common [ vol +1% +0
      bind -f common ] vol +0 +1%
      bind -f common ^B win-page-up
      bind -f common ^C echo Type :quit<enter> to exit cmus.
      bind -f common ^D win-half-page-down
      bind -f common ^E win-scroll-down
      bind -f common ^F win-page-down
      bind -f common ^L refresh
      bind -f common ^R toggle repeat_current
      bind -f common ^U win-half-page-up
      bind -f common ^Y win-scroll-up
      bind -f common a win-add-l
      bind -f common b player-next
      bind -f common c player-pause
      bind -f common delete win-remove
      bind -f common down win-down
      bind -f common e win-add-q
      bind -f common end win-bottom
      bind -f common enter win-activate
      bind -f common f toggle follow
      bind -f common g win-top
      bind -f common h seek -5
      bind -f common home win-top
      bind -f common i win-sel-cur
      bind -f common j win-down
      bind -f common k win-up
      bind -f common l seek +5
      bind -f common left seek -5
      bind -f common m toggle aaa_mode
      bind -f common mlb_click_selected win-activate
      bind -f common mouse_scroll_down win-down
      bind -f common mouse_scroll_up win-up
      bind -f common n search-next
      bind -f common o toggle play_sorted
      bind -f common p win-mv-after
      bind -f common page_down win-page-down
      bind -f common page_up win-page-up
      bind -f common q quit -i
      bind -f common r toggle repeat
      bind -f common right seek +5
      bind -f common s toggle shuffle
      bind -f common space win-toggle
      bind -f common t toggle show_remaining_time
      bind -f common tab win-next
      bind -f common u update-cache
      bind -f common up win-up
      bind -f common v player-stop
      bind -f common x player-play
      bind -f common y win-add-p
      bind -f common z player-prev
      bind -f common { vol -1% -0
      bind -f common } vol -0 -1%
      fset unheard=play_count=0
      factivate
    '';
  };
}
