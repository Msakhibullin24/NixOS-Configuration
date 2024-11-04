{
  imports = [
    ./hardware-configuration.nix
    ./modules
    ./packages.nix
  ];

  networking.hostName = "nixos";

  time.timeZone = "Europe/Moscow";

  i18n.defaultLocale = "en_US.UTF-8";

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];

    substituters = [
      "https://cache.garnix.io"
    ];
    trusted-public-keys = [
      "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
    ];
  };

  system.stateVersion = "24.11";
}
