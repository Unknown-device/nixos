{
  inputs,
  self,
  ...
}: {
  flake.wrapperModules.niri = {
    config,
    lib,
    pkgs,
    ...
  }: {
    options.terminal = lib.mkOption {
      type = lib.types.str;
      default = "kitty";
    };

    config = {
      settings = let
        noctaliaExe = lib.getExe self.packages.${config.pkgs.stdenv.hostPlatform.system}.noctalia-shell;
      in {
        prefer-no-csd = null;

        debug.honor-xdg-activation-with-invalid-serial = null;

        cursor = {
          xcursor-theme = "Bibata-Modern-Classic";
          xcursor-size = 24;
        };

        input = {
          keyboard = {
            numlock = null;
            xkb = {};
          };
          touchpad = {
            tap = null;
            natural-scroll = null;
          };
          mouse = {};
          trackpoint = {};
        };

outputs = {
  "HDMI-A-1" = {
    mode = "1920x1080@60.000";
    transform = "normal";
    position = {
      _attrs = { x = 0; y = 0; };
    };
  };

  "eDP-1" = {
    mode = "1366x768@60";
    transform = "normal";
    position = {
      _attrs = { x = 1920; y = 0; };
    };
  };
};
        spawn-at-startup = [ noctaliaExe ];

        layout = {
          gaps = 3;
          center-focused-column = "never";

          preset-column-widths = [
            { proportion = 0.33333; }
            { proportion = 0.5; }
            { proportion = 0.66667; }
          ];

          default-column-width = { proportion = 0.5; };

          focus-ring = {
            width = 1;
            active-color = "#7fc8ff";
          };
        };

        hotkey-overlay.skip-at-startup = null;

        screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

        # ✅ FIXED window rules
        window-rules = [
          {
            geometry-corner-radius = 3;
            clip-to-geometry = true;
            default-column-width = { proportion = 0.75; };
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

        # ✅ FIXED layer rules
        layer-rules = [
          {
            matches = [
              { namespace = "^quickshell-overview$"; }
            ];
            place-within-backdrop = true;
          }
        ];

        binds = {
          "Mod+Slash".show-hotkey-overlay = null;

          "Mod+Return" = {
            _attrs.hotkey-overlay-title = "Open a Terminal: kitty";
            spawn = config.terminal;
          };

          "Mod+Right".spawn-sh = "dbus-send --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next";
          "Mod+Left".spawn-sh = "dbus-send --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous";

          "Mod+Shift+Slash" = {
            _attrs.allow-when-locked = true;
            spawn-sh = "dbus-send --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause";
          };

          "Mod+Up" = {
            _attrs.allow-when-locked = true;
            spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+";
          };

          "Mod+Down" = {
            _attrs.allow-when-locked = true;
            spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-";
          };

          "Mod+M" = {
            _attrs.allow-when-locked = true;
            spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          };

          "XF86AudioMicMute" = {
            _attrs.allow-when-locked = true;
            spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
          };

          "Mod+Shift+Up".spawn = [ "brightnessctl" "--class=backlight" "set" "+10%" ];
          "Mod+Shift+Down".spawn = [ "brightnessctl" "--class=backlight" "set" "10%-" ];

          "Mod+O".toggle-overview = null;
          "Mod+Q".close-window = null;

          "Mod+H".focus-column-left = null;
          "Mod+J".focus-window-down = null;
          "Mod+K".focus-window-up = null;
          "Mod+L".focus-column-right = null;

          "Mod+Ctrl+H".move-column-left = null;
          "Mod+Ctrl+J".move-window-down = null;
          "Mod+Ctrl+K".move-window-up = null;
          "Mod+Ctrl+L".move-column-right = null;

          "Mod+Shift+H".focus-monitor-left = null;
          "Mod+Shift+J".focus-monitor-down = null;
          "Mod+Shift+K".focus-monitor-up = null;
          "Mod+Shift+L".focus-monitor-right = null;

          "Mod+Shift+Ctrl+H".move-column-to-monitor-left = null;
          "Mod+Shift+Ctrl+J".move-column-to-monitor-down = null;
          "Mod+Shift+Ctrl+K".move-column-to-monitor-up = null;
          "Mod+Shift+Ctrl+L".move-column-to-monitor-right = null;

          "Mod+Tab".focus-workspace-previous = null;

          "Mod+BracketLeft".consume-or-expel-window-left = null;
          "Mod+BracketRight".consume-or-expel-window-right = null;
          "Mod+Period".expel-window-from-column = null;

          "Mod+R".switch-preset-column-width = null;
          "Mod+Shift+R".switch-preset-window-height = null;

          "Mod+F".maximize-column = null;
          "Mod+Shift+F".fullscreen-window = null;

          "Mod+Minus".set-column-width = "-10%";
          "Mod+Equal".set-column-width = "+10%";

          "Mod+Shift+Minus".set-window-height = "-10%";
          "Mod+Shift+Equal".set-window-height = "+10%";

          "Mod+Alt+V".toggle-window-floating = null;
          "Mod+Shift+V".switch-focus-between-floating-and-tiling = null;

          "Mod+Shift+S".screenshot = null;

          "Mod+Escape" = {
            _attrs.allow-inhibiting = false;
            toggle-keyboard-shortcuts-inhibit = null;
          };

          "Mod+Shift+E".quit = null;

          "Mod+Space".spawn-sh = [ "${noctaliaExe} ipc call launcher toggle" ];
          "Mod+S".spawn-sh = [ "${noctaliaExe} ipc call sessionMenu toggle" ];
          "Mod+Comma".spawn-sh = [" ${noctaliaExe} ipc call settings toggle "];
         "Mod+V".spawn-sh = [" ${noctaliaExe} ipc call launcher clipboard "];
         "Mod+C".spawn-sh = [" ${noctaliaExe} ipc call launcher calculator "];
          "Mod+Alt+L".spawn-sh = [" ${noctaliaExe} ipc call lockScreen lock "];

          "Mod+W".spawn = "firefox";
          "Mod+E".spawn = "nemo";
          "Mod+T".spawn-sh = [ "${noctaliaExe} ipc call plugin:todo togglePanel" ];

          "Mod+Shift+P".power-off-monitors = null;
        };
      };
    };
  };

  perSystem = {pkgs, ...}: {
    packages.niri = inputs.wrapper-modules.wrappers.niri.wrap {
      inherit pkgs;
      imports = [self.wrapperModules.niri];
    };
  };
}
