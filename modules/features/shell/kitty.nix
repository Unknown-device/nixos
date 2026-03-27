{
  self,
  inputs,
  ...
}: {
  flake.wrapperModules.kitty = {
    config,
    lib,
    ...
  }: {
    options.shell = lib.mkOption {
      type = lib.types.str;
      default = "";
    };
    config = {
      args = lib.mkAfter (lib.optionals (config.shell != "") [config.shell]);
      settings = {
        enable_audio_bell = "no";

        font_size = 15;
        font_family = "JetBrainsMono Nerd Font";

        cursor_text_color = "background";

        allow_remote_control = "yes";
        shell_integration = "enabled";

        cursor_trail = 3;

        };
    };
  };

  perSystem = {pkgs, ...}: {
    packages.kitty =
      (inputs.wrappers.wrapperModules.kitty.apply {
        inherit pkgs;
        imports = [self.wrapperModules.kitty];
      }).wrapper;
  };
}
