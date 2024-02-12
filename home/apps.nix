{ config, pkgs, lib,  ... }:

{
  programs.tmux.enable = true;

  programs.git = {
    enable = true;
    userName = "pwnwriter";
    userEmail = "hey@pwnwriter.xyz";
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

 programs.gpg = {
    enable = true;
    homedir = "${config.xdg.dataHome}/gnupg";
  };

  home.file = {
    ".config/starship.toml" = { source = ./configs/starship.toml; };
    ".config/wezterm" = { source = ./configs/wezterm; };
  };
}

