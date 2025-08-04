{
  ...
}:

let
  systemDir = ../../modules/system;
  Module = name: systemDir + "/${name}.nix";
  Default = name: systemDir + "/${name}/default.nix";
in
{
  imports = [
    /etc/nixos/hardware-configuration.nix
    (Module "base/user")
    (Module "base/locale")
    (Module "services/xmrig")
    (Module "services/ssh")
    (Default "security")
  ];

  environment.sessionVariables.HOST = "raspberry";

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  system.stateVersion = "25.05";
}
