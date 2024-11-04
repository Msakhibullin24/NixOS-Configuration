{
  programs.mpv = {
    enable = true;

    config = {
      profile = "sw-fast";
      dither-depth = "auto";
      hwdec = "auto";
      hwdec-codecs = "all";
      cache = "yes";
      gpu-context = "wayland";
      gpu-api = "auto";
    };
  };
}
