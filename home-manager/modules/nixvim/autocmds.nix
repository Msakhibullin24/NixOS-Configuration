{
  programs.nixvim = {
    autoCmd = [
      {
        event = [ "BufEnter" ];
        command = ":set fo-=c fo-=r fo-=o";
      }
      {
        event = [ "FileType" ];
        pattern = [ "help" "alpha" "dashboard" "neo-tree" "toggleterm" "floatterm" ];
        callback.__raw = "function() vim.b.miniindentscope_disable = true end";
      }
    ];
  };
}
