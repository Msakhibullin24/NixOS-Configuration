{
  services.openssh = {
    enable = true;
    settings = {
      X11Forwarding = false;
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
  };
  programs.ssh = {
    enableAskPassword = false;
  };
}
