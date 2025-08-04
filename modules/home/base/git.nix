{ ... }:

{
  programs.gh = {
    enable = true;
  };

  programs.lazygit.enable = true;

  programs.git = {
    enable = true;

    userName = "SeppDev";
    userEmail = "70803492+SeppDev@users.noreply.github.com";
    extraConfig.init.defaultBranch = "main";
  };
}
