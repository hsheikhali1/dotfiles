{ pkgs, ... }: {
  programs.git = {
    enable = true;

    # ignores = [""]

    extraConfig = {
      core = {
        autocrlf = false;
        page = "${pkgs.delta}/bin/delta";
        fsmonitor = true;
      };
      delta = {
        enable = true;
        line-numbers = true;
        navigate = true;
      };
      protocol = { version = 2; };
      user = {
        name = "Harun Sheikhali";
        email = "sufisheikhali@gmail.com";
      };
    };
  };
}
