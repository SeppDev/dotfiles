{ ... }:
{
  users.users.user = {
    isNormalUser = true;
    description = "user";
    group = "user";
    extraGroups = [
      "networkmanager"
      "wheel"
      "adbusers"
    ];
  };

  users.groups.user = { };
}
