{ config, ... }:
# let sshAuthSock = "${config.home.homeDirectory}/.1password/agent.sock";
{
  # home.sessionVariables = {
  #   SSH_AUTH_SOCK = sshAuthSock;
  # };
  programs.ssh = {
    enable = true;
    forwardAgent = true;
    matchBlocks = {
      "nixos-server" = {
        port = 6969;
        hostname = "192.168.146.119";
      };
      # "*" = {
      #   extraOptions = {
      #     IdentityAgent = ''"${sshAuthSock}"'';
      #   };
      # };
    };
  };
}
