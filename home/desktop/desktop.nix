{
  config,
  pkgs,
  user,
  ...
}: {
  # Enable Unsupported GPU for Wayland because of NVidia
  wayland.windowManager.sway.extraOptions = ["--unsupported-gpu"];

  # Wallpaper
  home.file.".config/wall".source = config.lib.file.mkOutOfStoreSymlink ../../modules/themes/wall;

  # UI Cursor
  home.pointerCursor = {
    name = "Dracula-cursors";
    package = pkgs.dracula-theme;
    size = 16;
    gtk.enable = true;
    x11.enable = true;
  };

  fonts.fontconfig.enable = true;

  # UI Theme
  gtk = {
    enable = true;
    theme = {
      # TODO: change UI theme
      name = "Dracula";
      package = pkgs.dracula-theme;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
    iconTheme = {
      # TODO: change icon theme
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    font = {
      name = "Cantarell";
    };
  };

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };
}
