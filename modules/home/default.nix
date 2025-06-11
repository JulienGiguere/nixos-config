{inputs, username, host, ...}: {
  imports = [
    ./audacious.nix                   # music player
    ./bat.nix                         # better cat command
    ./btop.nix                        # resouces monitor 
    ./fastfetch.nix                   # fetch tool
    ./gaming.nix                      # packages related to gaming
    ./git.nix                         # version control
    ./gnome.nix                       # gnome apps
    ./gtk.nix                         # gtk theme
    ./hyprland                        # window manager
    ./kitty.nix                       # terminal
    ./swayosd.nix                     # brightness / volume wiget
    ./swaync/swaync.nix               # notification deamon
    ./nemo.nix                        # file manager
    #./nvim.nix                        # neovim editor
    ./p10k/p10k.nix
    ./packages.nix                    # other packages
    #./poweralertd.nix             # power notifications
    ./retroarch.nix  
    ./rofi.nix                        # launcher
    ./scripts/scripts.nix             # personal scripts
    #./spicetify.nix                   # spotify client
    ./swaylock.nix                    # lock screen
    ./viewnior.nix                    # image viewer
    #./vscodium.nix                    # vscode forck
    ./waybar                          # status bar
    #./wezterm.nix                     # terminal
    ./xdg-mimes.nix                   # xdg config
    ./zsh                             # shell
    ./latex.nix
    ./emacs.nix
];
}
