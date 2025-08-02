{ pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    # upower
  ];

  boot.kernelParams = [
    "acpi_osi=!"
    "acpi_osi=\"Windows 2022\""
  ];

  services.system76-scheduler.settings.cfsProfiles.enable = true;

  services.tlp = {
    enable = true;
    settings = {
      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
    };
  };

  # Disable GNOMEs power management
  services.power-profiles-daemon.enable = false;

  # Enable powertop
  powerManagement.powertop.enable = true;

  # Enable thermald (only necessary if on Intel CPUs)
  services.thermald.enable = true;

  services.upower.enable = false;
  powerManagement.enable = false;

  services.auto-cpufreq = {
    enable = false;
    settings = {
      battery = {
        governor = "powersave";
        turbo = "never";
      };
      charger = {
        governor = "performance";
        turbo = "never";
      };
    };
  };
}
