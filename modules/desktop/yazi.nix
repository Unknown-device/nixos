{pkgs, ...}: {
  programs.yazi = {
    enable = true;
    keymap.mgr.prepend_keymap = [
      {
        on = "<C-n>";
        run = ''
          shell 'dragon-drop -x -i -T $@' --confirm
        '';

        desc = "Maximize or restore the preview pane";
      }
    ];
  };
}
