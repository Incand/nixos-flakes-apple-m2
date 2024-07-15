{ theme, ... }: {
  programs.i3status-rust = {
    enable = true;

    bars.top = {
      blocks = [
        {
          block = "net";
          format = " $icon  {$ssid $signal_strength|Wired connection} ";
        }
        {
          block = "disk_space";
          path = "/";
          info_type = "available";
          interval = 60;
          warning = 20.0;
          alert = 10.0;
        }
        {
          block = "memory";
          format = " $icon $mem_used_percents ";
        }
        {
          block = "cpu";
          interval = 1;
          format = " $icon $utilization ";
        }
        {
          block = "keyboard_layout";
          driver = "sway";
          format = " ${builtins.fromJSON '' "\uf11c" ''} $layout ";
          mappings = {
            "English (US)" = "EN";
            "German (N/A)" = "DE";
          };
        }
        { block = "sound"; }
        {
          block = "battery";
          format = " $icon $percentage ";
        }
        {
          block = "time";
          interval = 60;
          format = " $timestamp.datetime(f:'%a %d.%m. %R') ";
        }
      ];
      icons = "awesome6";
      theme = "plain";
    };
  };
}
