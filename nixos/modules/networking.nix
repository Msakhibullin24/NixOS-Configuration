{
  networking = {
    nameservers = [
      "8.8.8.8"
      "8.8.4.4"
      "1.1.1.1"
    ];
    firewall = {
      enable = true;
      allowedTCPPorts = [
        22
        80
        8080
        6567
        7777
        9001
        26000
      ];
      allowedUDPPorts = [
        22
        80
        8080
        6567
        7777
        9001
        26000
      ];
    };
    networkmanager = {
      enable = true;
      dns = "none";
    };
  };
}
