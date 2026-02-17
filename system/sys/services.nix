{ lib, pkgs, ... }:
{

  services.xserver = {
    enable = true;
    excludePackages = [ pkgs.xterm ];
    # upscaleDefaultCursor = true;
  };

  services.xserver.xkb = {
    layout = "cn";
    variant = "";
  };

  services = {
    flatpak.enable = true; # 软件包

    power-profiles-daemon.enable = true;

    dbus.enable = true;

    usbguard.dbus.enable = true;

    udisks2.enable = true;

    upower.enable = true;

    envfs.enable = false;

    gvfs.enable = true;

    seatd.enable = true;

    openssh.enable = true;

    acpid.enable = true;

    speechd.enable = lib.mkForce false;

  };
}
