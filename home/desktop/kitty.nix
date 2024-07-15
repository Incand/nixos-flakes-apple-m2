{ theme, ... }: {
  programs.kitty = {
    enable = true;
    font = {
      name = "FiraCode";
      size = 20;
    };

    extraConfig = ''
      background	#${theme.background}
      foreground    	#${theme.foreground}
      
      # black
      color0		#${theme.color0}
      color8		#${theme.color8}
      
      # red
      color1		#${theme.color1}
      color9		#${theme.color9}
      
      # green
      color2		#${theme.color2}
      color10		#${theme.color10}
      
      # yellow
      color3		#${theme.color3}
      color11		#${theme.color11}
      
      # blue
      color4		#${theme.color4}
      color12		#${theme.color12}
      
      # magenta
      color5		#${theme.color5}
      color13		#${theme.color13}
      
      # cyan
      color6		#${theme.color6}
      color14		#${theme.color14}
      
      # white
      color7		#${theme.color7}
      color15		#${theme.color15}
    '';
  };

  #home.file.".Xdefaults" = {
  #  enable = true;
  #  text = ''
  #    vim: ft=dosini cms=#%s
  #  '';
  #};
}
