{
  security.sudo.enable = false;
  security.doas.enable = true;
  security.doas.extraRules = [{
    users = [ "darkangel" ];
    keepEnv = true;
    persist = true;
  }];
}
