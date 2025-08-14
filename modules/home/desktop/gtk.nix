{pkgs, ...}:
{
  home.packages = with pkgs; [
    gtk4
    gtk3
  ];
  
  
}
