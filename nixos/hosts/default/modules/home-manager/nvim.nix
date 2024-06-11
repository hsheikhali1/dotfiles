{ config, pkgs, lib, ... }: {
  xdg.configFile = {
    nvim = {
      source = config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/git/dotfiles/nvim";
      recursive = true;
    };
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = false;
    withRuby = false;
    withPython3 = false;
    defaultEditor = true;
    coc.enable = false;

    # extraLuaPackages = ps: [ ps.jsregexp ];
    extraPackages = with pkgs; [
      gcc
      sumneko-lua-language-server
      nil
      nixfmt
      lua
      ripgrep
    ];
  };
}
