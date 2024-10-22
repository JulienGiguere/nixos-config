{ config, pkgs, username, ... }:
{
  # Add user to groups
  users.users.${username}.extraGroups = [ "vboxusers" "kvm" "libvirtd" "docker"];

  # Install necessary packages
  environment.systemPackages = with pkgs; [
    qemu
    virt-manager
    virt-viewer
    spice spice-gtk
    spice-protocol
    spice-gtk
    libvirt
    win-virtio
    win-spice
    adwaita-icon-theme
    virtualbox
    linuxPackages.virtualboxGuestAdditions
    linuxPackages.virtualbox
  ];

  boot.kernelModules = [ "vboxdrv" "vboxnetflt" "vboxnetadp" "vboxpci" ];

  # networking = {
  #   networkmanager.enable = true;  # If using NetworkManager
  #   bridges.br0.interfaces = [ "eth0" ];
  # };
  # networking.useNetworkd = true;
  
  # Manage the virtualisation services
  virtualisation = {
    docker.enable = true;
    virtualbox.host.enable = true;
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
      };
    };
    spiceUSBRedirection.enable = true;
  };
  services.spice-vdagentd.enable = true;
}
