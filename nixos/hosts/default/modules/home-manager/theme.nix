{ config, pkgs, ... }: {

  gtk = {
    enable = true;
    # theme = {
    #   package = pkgs.nordic;
    #   name = "Nordic-bluish-accent";
    # };
    theme = {
      package = pkgs.tokyonight-gtk-theme;
      name = "Tokyonight-Dark-B";
    };
  };
  dconf.settings = {
    "org/gnome/shell/extensions/user-theme" = {
      name = "Tokyonight-Dark-B";
    };
  };
  xdg.configFile = {
    "gtk-4.0/assets".source =
      "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source =
      "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source =
      "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };
}
