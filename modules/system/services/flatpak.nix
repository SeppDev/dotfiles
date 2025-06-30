{ ... }:
{
  services.flatpak = {
    enable = true;
    remotes = [
      {
        name = "flathub";
        url = "https://flathub.org/repo/flathub.flatpakrepo";
      }
    ];
  };
}
