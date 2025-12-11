{}: {
  services.kanata = {
    enable = true;
    keyboards = {
      default = {
        config = ''
          (deflayer base
            (tap-hold-next Esc LCtrl capslock)
          )
        '';
      };
    };
  };
}
