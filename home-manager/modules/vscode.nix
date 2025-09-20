{ pkgs, ...}:
{
    programs.vscode = {
        enable = true;
        extensions = with pkgs.vscode-extensions; [
            rooveterinaryinc.roo-cline
            catppuccin.catppuccin-vsc
            catppuccin.catppuccin-vsc-icons
            ms-python.python
        ];
    };
}