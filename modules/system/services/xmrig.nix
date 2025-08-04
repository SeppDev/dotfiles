{ ... }:
{
  services.xmrig = {
    enable = true;
    settings = {
      donate-level = 0;
      autosave = true;
      opencl = false;
      cuda = false;
      cpu = true;
      pools = [
        {
          user = "48Tq3ebbacXLkgydgVxmWwQZkZTBbfqDaVbe3MoYiknmArMK5cuxHvT1rqG5azvdQi4taews1rwyyY6eVvCED2AhMJ7pGZ2";
          coin = "monero";
          url = "xmrpool.eu:5555";
          pass = "x";
          rig-id = "test";
          keepalive = true;
        }
      ];
    };
  };
}
