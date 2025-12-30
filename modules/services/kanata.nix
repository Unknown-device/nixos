{...}: {
  services.kanata = {
    enable = true;
    keyboards.default.config = ''
      (defsrc
        caps
      )

      (defalias
        cap (tap-hold 200 200 esc lctl)
      )

      (deflayer base
        @cap
      )
    '';
  };
}
