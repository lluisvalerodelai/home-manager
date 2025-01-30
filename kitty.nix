# { config, lib, pkgs, ...}:

{
	programs.kitty = {
		enable = true;
    themeFile = "3024_Night";
    extraConfig = ''
      cursor_shape block 
      '';
};
}
