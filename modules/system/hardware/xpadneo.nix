{ pkgs, ... }:
{
  hardware.xpadneo.enable = true;

  boot.extraModprobeConfig = '' options bluetooth disable_ertm=1 '';

  boot.initrd.kernelModules = [
    "usbhid"
    "joydev"
    "xpad"
  ];
}
