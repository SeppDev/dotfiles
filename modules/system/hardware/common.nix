{ ... }:
{
  hardware = {
    enableAllFirmware = true;
    graphics.enable = true;
  };

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
