{ config, pkgs, ... }:

{
  imports = [
  	./modules/nixos/allowed-unfree.nix
    ./modules/home-manager/git.nix
    ./modules/home-manager/nvim.nix
	  ./modules/home-manager/fish.nix
    ./modules/home-manager/wezterm.nix
    ./modules/home-manager/kitty.nix
    ./modules/home-manager/theme.nix
    ./modules/home-manager/starship.nix
    #./modules/home-manager/ssh.nix
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "workstation";
  home.homeDirectory = "/home/workstation";


  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; })
    maple-mono

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    (discord.override {
      withOpenASAR = true;
      withVencord = true;
    })
    dmenu
    wget
    alacritty
    signal-desktop
    slack
    gnome.gnome-tweaks
    rustup
    fnm
    atuin
    brave
    pcmanfm
    fzf
    jq
    lazygit
    xclip
    dunst
    gnumake
    nix-prefetch-github
    nexusmods-app
    chromium
    # pamixer
    # imagemagick
    # ncmpcpp
    # mpd
    # mpdris2
    # neofetch
    # brightnessctl
    # inotify-tools
    # uptimed
    # brillo
    # bluez
    # picom
    # redshift
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/workstation/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # enable direnv for flakes
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
}
