{ self, pkgs, lib, inputs, ...}: 
{
  # imports = [ inputs.nix-gaming.nixosModules.default ];
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      substituters = [ "https://nix-gaming.cachix.org" ];
      trusted-public-keys = [ "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4=" ];
    };
  };
  nixpkgs = {
    overlays = [
      inputs.nur.overlays.default
    ];
  };

  environment.systemPackages = with pkgs; [
    wget
    git

    # Custom wrapper for Discord
    (pkgs.writeShellApplication {
      name = "discord";
      text = ''
    #!/bin/sh
    exec ${pkgs.discord}/bin/discord --enable-features=UseOzonePlatform --ozone-platform=x11
  '';
    })

    # Desktop entry for Discord
    (pkgs.makeDesktopItem {
      name = "discord";
      exec = "discord"; # This will call the wrapper defined above
      desktopName = "Discord";
      comment = "Launch Discord with Wayland rendering fix";
      icon = "${pkgs.discord}/share/pixmaps/discord.png";
    })
  ];

  time.timeZone = "America/Montreal";
  i18n.defaultLocale = "en_US.UTF-8";
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true;
  system.stateVersion = "24.05";
}
