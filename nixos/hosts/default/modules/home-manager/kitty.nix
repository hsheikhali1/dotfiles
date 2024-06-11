{ pkgs, ... }: {
  programs.kitty = {
    enable = true;
    theme = "Tokyo Night";
    font.name = "Maple Mono";
  };
}
