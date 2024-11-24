{
  security = {
    sudo.enable = false;
    doas = {
      enable = true;
      extraRules = [
        {
          users = ["darkangel"];
          keepEnv = true;
          persist = true;
        }
      ];
    };
  };
}
