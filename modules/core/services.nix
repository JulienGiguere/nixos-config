{ pkgs, ... }:
{
  services = {
    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;
    dbus.enable = true;
    fstrim.enable = true;
    blueman.enable = true;
    lvm.enable = false;
    mullvad-vpn.enable = true;
    spice-vdagentd.enable = true;
    tailscale.enable = true;
    postgresql.enable = true;
    dnsmasq.enable = true;
    dnsmasq.settings.server = ["8.8.8.8" "172.16.10.205"];
    openssh = {
      enable = true;
      ports = [ 22 ];
      settings = {
        PasswordAuthentication = false;
        AllowUsers = ["julien"]; # Allows all users by default. Can be [ "user1" "user2" ]
        UseDns = true;
        X11Forwarding = false;
        PermitRootLogin = "prohibit-password";
      };
    };
  };
}
