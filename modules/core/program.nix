{ pkgs, lib, ... }: 
{
  programs.dconf.enable = true;
  programs.zsh.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    # pinentryFlavor = "";
  };
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [];
  programs.kdeconnect.enable = true;
  programs.adb.enable = true;
  programs.wireshark.enable = true;
}
