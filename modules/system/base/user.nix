{ ... }:
{
  users.users.sepp = {
    isNormalUser = true;
    description = "sepp";
    extraGroups = [
      "networkmanager"
      "wheel"
      "adbusers"
    ];
  };
}
