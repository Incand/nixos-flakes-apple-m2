{ pkgs, ... }: {
 home.packages = with pkgs.jetbrains; [
   (plugins.addPlugins idea-community [
     "ideavim"
   ])
 ];
}

