{ self, inputs, ... }: {
  perSystem = { pkgs, ... }: {
    packages.noctalia = inputs.wrapper-modules.wrappers.noctalia.wrap {
      inherit pkgs; # THIS PART IS VERY IMPORTAINT, I FORGOT IT IN THE VIDEO!!!
      settings =
  builtins.fromTOML
    (builtins.readFile ./noctalia-config.toml);
   };
  };
}
