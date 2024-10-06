{
  networking = {
    nameservers = [ "8.8.8.8" "1.1.1.1" ];
    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 80 7777 9001 ];
      allowedUDPPorts = [ 22 80 7777 ];
    };
    networkmanager = {
      enable = true;
      dns = "none";
    };
  };
}
