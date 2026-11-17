
{
  inputs,
  self,
  ...
}:
{
  flake.wrapperModules.niri =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      imports = [
        inputs.wrapper-modules.wrapperModules.niri
      ];

      options.terminal = lib.mkOption {
        type = lib.types.str;
        default = "kitty";
        description = "Terminal emulator used by Niri.";
      };

      config = {

        settings =
          let
            noctaliaExe =
              lib.getExe self.packages.${pkgs.stdenv.hostPlatform.system}.noctalia;
          in
          {
            prefer-no-csd = true;

            debug.honor-xdg-activation-with-invalid-serial = true;

            cursor = {
              xcursor-theme = "Bibata-Modern-Classic";
              xcursor-size = 24;
            };

            input = {
              keyboard = {
                numlock = true;
                xkb = { };
              };

              touchpad = { };
              mouse = { };
              trackpoint = { };
            };

            outputs = {
              "HDMI-A-1" = {
                mode = "1920x1080@60.000";
                transform = "normal";

                position = _: {
                  props = {
                    x = 1920;
                    y = 0;
                  };
                };
              };

              "eDP-1" = {
                mode = "1366x768@60";
                transform = "normal";

                position = _: {
                  props = {
                    x = 0;
                    y = 0;
                  };
                };
              };
            };

            spawn-at-startup = [
              noctaliaExe
            ];

            layout = {
              gaps = 3;
              center-focused-column = "never";

              preset-column-widths = [
                { proportion = 0.33333; }
                { proportion = 0.5; }
                { proportion = 0.66667; }
              ];

              default-column-width.proportion = 0.5;

              focus-ring = {
                width = 1;
                active-color = "#7fc8ff";
              };
            };

            hotkey-overlay.skip-at-startup = true;

            screenshot-path =
              "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

            window-rules = [
              {
                geometry-corner-radius = 3;
                clip-to-geometry = true;

                default-column-width = {
                  proportion = 0.75;
                };
              }

              {
                matches = [
                  { app-id = "firefox"; }
                ];

                open-maximized = true;
              }

              {
                matches = [
                  {
                    app-id = "firefox$";
                    title = "^Picture-in-Picture$";
                  }
                ];

                open-floating = true;
              }
            ];

            layer-rules = [
              {
                matches = [
                  { namespace = "^quickshell-overview$"; }
                ];

                place-within-backdrop = true;
              }
            ];

            binds = {
              "Mod+Slash".show-hotkey-overlay = { };

              "Mod+Return" = _: {
                props.hotkey-overlay-title = "Open a Terminal";
                content.spawn = config.terminal;
              };

              "Mod+Right".spawn-sh =
                "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next";

              "Mod+Left".spawn-sh =
                "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous";

              "Mod+Shift+Slash" = _: {
                props.allow-when-locked = true;
                content.spawn-sh =
                  "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause";
              };

              "Mod+Up" = _: {
                props.allow-when-locked = true;
                content.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+";
              };

              "Mod+Down" = _: {
                props.allow-when-locked = true;
                content.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-";
              };

              "Mod+M" = _: {
                props.allow-when-locked = true;
                content.spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
              };

              "Mod+Shift+Up".spawn = [
                "brightnessctl"
                "--class=backlight"
                "set"
                "+10%"
              ];

              "Mod+Shift+Down".spawn = [
                "brightnessctl"
                "--class=backlight"
                "set"
                "10%-"
              ];

              "Mod+O".toggle-overview = { };
              "Mod+Q".close-window = { };

              "Mod+H".focus-column-left = { };
              "Mod+J".focus-window-down = { };
              "Mod+K".focus-window-up = { };
              "Mod+L".focus-column-right = { };

              "Mod+Ctrl+H".move-column-left = { };
              "Mod+Ctrl+J".move-window-down = { };
              "Mod+Ctrl+K".move-window-up = { };
              "Mod+Ctrl+L".move-column-right = { };

              "Mod+Shift+H".focus-monitor-left = { };
              "Mod+Shift+J".focus-monitor-down = { };
              "Mod+Shift+K".focus-monitor-up = { };
              "Mod+Shift+L".focus-monitor-right = { };

              "Mod+Shift+Ctrl+H".move-column-to-monitor-left = { };
              "Mod+Shift+Ctrl+J".move-column-to-monitor-down = { };
              "Mod+Shift+Ctrl+K".move-column-to-monitor-up = { };
              "Mod+Shift+Ctrl+L".move-column-to-monitor-right = { };

              "Mod+Tab".focus-workspace-previous = { };

              "Mod+BracketLeft".consume-or-expel-window-left = { };
              "Mod+BracketRight".consume-or-expel-window-right = { };
              "Mod+Period".expel-window-from-column = { };

              "Mod+R".switch-preset-column-width = { };
              "Mod+Shift+R".switch-preset-window-height = { };

              "Mod+F".maximize-column = { };
              "Mod+Shift+F".fullscreen-window = { };

              "Mod+Minus".set-column-width = "-10%";
              "Mod+Equal".set-column-width = "+10%";

              "Mod+Shift+Minus".set-window-height = "-10%";
              "Mod+Shift+Equal".set-window-height = "+10%";

              "Mod+Alt+V".toggle-window-floating = { };
              "Mod+Shift+V".switch-focus-between-floating-and-tiling = { };

              "Mod+Shift+S".screenshot = { };

              "Mod+Escape" = _: {
                props.allow-inhibiting = false;
                content.toggle-keyboard-shortcuts-inhibit = { };
              };

              "Mod+Shift+E".quit = { };

              "Mod+Space".spawn-sh =
                "${noctaliaExe} msg panel-toggle launcher";

              "Mod+S".spawn-sh =
                "${noctaliaExe} ipc call sessionMenu toggle";

              "Mod+Comma".spawn-sh =
                "${noctaliaExe} ipc call settings toggle";

              "Mod+V".spawn-sh =
                "${noctaliaExe} msg panel-toggle clipboard";

              "Mod+C".spawn-sh =
                "${noctaliaExe} ipc call launcher calculator";

              "Mod+Alt+L".spawn-sh =
                "${noctaliaExe} ipc call lockScreen lock";

              "Mod+W".spawn = "firefox";
              "Mod+E".spawn = "nemo";

              "Mod+T".spawn-sh =
                "${noctaliaExe} ipc call plugin:todo togglePanel";

              "Mod+Shift+P".power-off-monitors = { };
            };
          };
      };
    };

  perSystem =
    { pkgs, ... }:
    {
      packages.niri = inputs.wrapper-modules.wrappers.niri.wrap {
        inherit pkgs;

        imports = [
          self.wrapperModules.niri
        ];
      };
    };
}

