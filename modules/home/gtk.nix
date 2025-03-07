{ pkgs, config, ... }:
let 
  monolisa = pkgs.callPackage ../../pkgs/monolisa/monolisa.nix {}; 
  monolisa-nerd = pkgs.callPackage ../../pkgs/monolisa/monolisa-nerd.nix { inherit monolisa; }; 
in
{
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.nerd-fonts.fira-code
    pkgs.nerd-fonts.caskaydia-cove
    pkgs.nerd-fonts.symbols-only
    twemoji-color-font
    noto-fonts-emoji
    # monolisa
    # monolisa-nerd
    iosevka
  ];

  gtk = {
    enable = true;
    font = {
      name = "CaskaydiaCove Nerd Font";
      size = 8;
    };
    theme = {
      name = "Gruvbox-Green-Dark";
      package = pkgs.gruvbox-gtk-theme.override {
        colorVariants = [ "dark" ];
        themeVariants = [ "green" ];
        tweakVariants = [ "macos" ];
      };
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme.override {
        color = "black";
      };
    };
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 12;
    };
  };
  
  home.pointerCursor = {
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    size = 12;
  };
}
