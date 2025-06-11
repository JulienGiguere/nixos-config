{ inputs, pkgs, ... }: 
let 
  _2048 = pkgs.callPackage ../../pkgs/2048/default.nix {}; 
in
{
  home.packages = (with pkgs; [

    ## Dev
    adoptopenjdk-icedtea-web
    gcc
    gdb
    gnumake
    jdk
    maven
    nodejs
    openjdk
    python3
    python312Packages.ipython
    hugo
    
    ## DevOps
    docker
    kubectl
    kubernetes-helm
    minikube
    tigervnc

    ## CLI utility
	  ani-cli
    bind                              # Domain Name Server
    cliphist
    dconf-editor                      # GTK settings editor
    ffmpeg                            # video converter and editor
    file                              # Show file information 
    gifsicle                          # gif util
    gtrash                            # rm replacement, put deleted files in system trash
    hexdump                           # displays file contents in different formats
    killall                           # kill me
    libnotify                         # lib for desktop notifications
    man-pages					            	  # extra man pages
    nitch                             # systhem fetch util - not neofetch ;-;
    onefetch                          # fetch utility for git repo
    openssl                           # cyrptographic library impl. SSL TSL protocols
    pamixer                           # pulseaudio command line mixer
    pandoc                            # document format conversion
    playerctl                         # controller for media players
    swappy                            # snapshot editing tool
    tldr                              # simplified man pages
    ttyper                            # cli typing test
    unzip
    wget                              # tool to retrieve files
    wl-clipboard                      # clipboard utils for wayland (wl-copy, wl-paste)
    xdg-utils                         # desktop tools
    xvfb-run                          # virtual X server env to run graphical applications
    xwayland
    yt-dlp-light                      # youtube-dl fork

    # Hack
    binsider                          # binary analizer
    bitwise                           # cli tool for bit / hex manipulation
    jq                                # JSON processor
    ncdu                              # disk space cli util
    xxd                               # create and reverse hex dumps of files

    ## GUI Apps
    kdePackages.kolourpaint           # paint
    audacity                          # audio editor
    bleachbit                         # cache cleaner
    evince                            # GNU pdf viewer
    gimp                              # Photo Editor
    godot_4                           # game engine
    inputs.zen-browser.packages."${pkgs.system}".default #browser
    keepassxc
    libreoffice                       # Office Apps
    pavucontrol                       # pulseaudio volume controle (GUI)
    pitivi                            # video editing
    qalculate-gtk                     # calculator
    signal-desktop
    soundwireserver                   # Turn your Android into wireless speaker
    tor-browser
    virt-manager
    vlc                               # media player
    wineWowPackages.wayland           # Wine
    winetricks                        # fixes things in wine
    zenity                            # display dialogs in commandline and shell scripts.
    mullvad-vpn

    nmap
    iputils
    gobuster
    exiftool
    thc-hydra
    wireshark
    ltrace
    radare2
    steghide
    poppler_utils
    qpdf
    pdfgrep
    binutils
    stegseek
    feroxbuster

    tcpdump
    
    # Base
    inputs.alejandra.defaultPackage.${system}
  ]);
}
