{ inputs, pkgs, ... }: 
let 
  _2048 = pkgs.callPackage ../../pkgs/2048/default.nix {}; 
in
{
  home.packages = (with pkgs; [
    _2048

    ## Editor
    emacs
    eclipses.eclipse-java
    xvfb-run

    ## Dev
    hugo
    maven
    openjdk
    adoptopenjdk-icedtea-web
    nodejs
    mongodb-ce
    jdk

    ## Documents
    texlive.combined.scheme-full
    
    ## DevOps
    minikube
    kubectl
    docker
    kubernetes-helm
    talosctl
    tigervnc

    # C / C++
    gcc
    gdb
    gnumake
    
    # Python
    python3
    python312Packages.ipython

    ## CLI utility
    ani-cli
    binsider
    bitwise                           # cli tool for bit / hex manipulation
    caligula                          # User-friendly, lightweight TUI for disk imaging
    dconf-editor
    docfd                             # TUI multiline fuzzy document finder
    eza                               # ls replacement
    entr                              # perform action when file change
    fd                                # find replacement
    ffmpeg
    file                              # Show file information 
    gtt                               # google translate TUI
    gifsicle                          # gif utility
    gtrash                            # rm replacement, put deleted files in system trash
    hexdump
    imv                               # image viewer
    jq                                # JSON processor
    killall
    lazygit
    libnotify
	  man-pages					            	  # extra man pages
    mimeo
    mpv                               # video player
    ncdu                              # disk space
    nitch                             # systhem fetch util
    openssl
    onefetch                          # fetch utility for git repo
    pamixer                           # pulseaudio command line mixer
    playerctl                         # controller for media players
    poweralertd
    programmer-calculator
    ripgrep                           # grep replacement
    swappy                            # snapshot editing tool
    tdf                               # cli pdf viewer
    tldr
    todo                              # cli todo list
    toipe                             # typing test in the terminal
    ttyper                            # cli typing test
    unzip
    valgrind                          # c memory analyzer
    wl-clipboard                      # clipboard utils for wayland (wl-copy, wl-paste)
    cliphist
    xwayland
    wget
    yazi                              # terminal file manager
    yt-dlp-light
    xdg-utils
    xxd
    pandoc
    bind

    ## CLI 
    cbonsai                           # terminal screensaver
    cmatrix
    pipes                             # terminal screensaver
    sl
    tty-clock                         # cli clock

    ## GUI Apps
    audacity
    bleachbit                         # cache cleaner
    firefox
    gimp
    libreoffice
    nix-prefetch-github
    obs-studio
    pavucontrol                       # pulseaudio volume controle (GUI)
    pitivi                            # video editing
    qalculate-gtk                     # calculator
    soundwireserver
    thunderbird
    vlc
    winetricks
    wineWowPackages.wayland
    zenity
    signal-desktop
    tor-browser
    
    chromium
    keepassxc
    teams-for-linux
    
    inputs.alejandra.defaultPackage.${system}
  ]);
}
