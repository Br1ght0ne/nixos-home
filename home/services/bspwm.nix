{ pkgs, ... }: {
  home.packages = [ pkgs.bspwm ];

  xdg.configFile.bspwm = {
    target = "bspwm/bspwmrc";
    executable = true;
    text = ''
      #!${pkgs.bash}/bin/bash

      scripts="$HOME/.local/bin"

      # bspc monitor -d 一 二 三 四 五 六 七 八 九 十
      bspc monitor -d 1 2 3 4 5 6 7 8 9 10

      wmname LG3D
      xsetroot -cursor_name left_ptr

      # pip3 install --user flashfocus
      # bspc config border_width            0

      bspc config border_width            2
      bspc config window_gap              5
      bspc config split_ratio             0.5
      bspc config borderless_monocle      true
      bspc config gapless_monocle         true
      bspc config single_monocle          true
      bspc config initial_polarity        second_child
      bspc config click_to_focus          any
      bspc config pointer_follows_monitor true

      bspc desktop 二 -l monocle
      bspc desktop 五 -l monocle

      bspc config external_rules_command "$scripts/bspwm_external_rules"

      "$scripts/bootstrap"
    '';
  };
}
