{ lib, pkgs, ... }: {
  users.users.hsheikhali = {
    isNormalUser = true;
    description = "hsheikhali";
    home = "/home/hsheikhali/"
  }
}
