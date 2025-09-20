{ pkgs, ...} 
{
    programs.vscode = {
        enable = true;
        extensions = with pkgs.vscode-extensions; [
            cline
            catppuccin.catppuccin-vsc
            catppuccin.catppuccin-vsc-icons
            ms-python.python
        ];
    }
}