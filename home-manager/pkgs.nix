{ pkgs, ... }:
let
  shared = with pkgs; [
    just
    bat
    zoxide
    eza
    ripgrep


    fzf
    jq
    aria2
    htop

    fastfetch
    neovim
  ];

  darwin =
    with pkgs;
    with pkgs.darwin.apple_sdk;
    [
      wezterm
      frameworks.Security
      frameworks.CoreFoundation
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];

  development = with pkgs; [
    clang
    stylua
    nixpkgs-fmt
    nil
    lua-language-server
  ] ++ (import ./dev.nix { pkgs = pkgs; });


  server =
    with pkgs;
    with pkgs.nodePackages_latest; [
      yazi
      tmux
      bun

      docker-compose

      nodejs_22
      pnpm
      bash-language-server
      typescript-language-server
    ];

in
{
  home.packages =
    shared
    ++ development
    ++ (
      if pkgs.stdenv.isDarwin
      then darwin
      else server
    );

}