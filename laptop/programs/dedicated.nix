{ config, pkgs, ... }:
{
  config.home.file = {
    ".config/alacritty" = {source = ./configs/alacritty;};
    ".config/cava" = {source = ./configs/cava;};
    ".config/wofi" = {source = ./configs/wofi;};
    ".config/bat" = {source = ./configs/bat;};
  };
}
