{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    blueman
    kdePackages.bluedevil
    bluez
    playerctl
  ];
  services.blueman.enable = true;

  boot.extraModprobeConfig = ''options bluetooth disable_ertm=1 '';

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
        Experimental = false;
      };
    };
  };

  systemd.user.services.mpris-proxy = {
    description = "Mpris proxy";
    after = [
      "network.target"
      "sound.target"
    ];
    wantedBy = [ "default.target" ];
    serviceConfig.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
  };

}
