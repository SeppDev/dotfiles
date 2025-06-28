{ pkgs, ... }:
{
  hardware = {
    enableAllFirmware = true;
    graphics.enable = true;
  };
  hardware.firmware = [
    pkgs.linux-firmware
  ];

  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };
  };
}
