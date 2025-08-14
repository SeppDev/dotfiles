{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    blueman
    bluez
    playerctl
  ];
  services.blueman.enable = true;
  # hardware.pulseaudio.enable = true;

  boot.extraModprobeConfig = ''options bluetooth disable_ertm=1 '';

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
        ControllerMode = "bredr";
        Experimental = true;
        FastConnectable = true;
      };
      Policy = {
        AutoEnable = true;
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
