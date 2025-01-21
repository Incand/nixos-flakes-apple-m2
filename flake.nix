{
  description = "Nix Environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-apple-silicon = {
      url = "github:tpwrules/nixos-apple-silicon";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      colors = {
        black = "000000";

        darkgray = "282c34";
        gray = "5c6370";
        lightgray = "828997";
        lightergray = "abb2bf";

        red = "be5046";
        lightred = "e06c75";

        green = "7a9f60";
        lightgreen = "98c379";

        yellow = "d19a66";
        lightyellow = "e5c07b";
      
        blue = "3b84c0";
        lightblue = "61afef";
      
        magenta = "9a52af";
        lightmagenta = "c678dd";
      
        lightcyan = "56b6c2";
        cyan = "3c909b";
      };
      themes = with colors; {
        dark = {
          type = "dark";

          background = black;
          foreground = lightergray;

          color0 = darkgray;
          color8 = lightergray;

          color1 = lightred;
          color9 = red;

          color2 = lightgreen;
          color10 = green;

          color3 = lightyellow;
          color11 = yellow;

          color4 = lightblue;
          color12 = blue;

          color5 = lightmagenta;
          color13 = magenta;

          color6 = lightcyan;
          color14 = cyan;

          color7 = lightergray;
          color15 = lightgray;
        };
        light = {
          type = "light";

          background = lightergray;
          foreground = black;

          color0 = darkgray;
          color8 = lightergray;

          color1 = lightred;
          color9 = red;

          color2 = lightgreen;
          color10 = green;

          color3 = lightyellow;
          color11 = yellow;

          color4 = lightblue;
          color12 = blue;

          color5 = lightmagenta;
          color13 = magenta;

          color6 = lightcyan;
          color14 = cyan;

          color7 = lightergray;
          color15 = lightgray;
        };
      };
      theme = themes.dark;
      font = {
        name = "FiraCode";
        size = 16;
      };
    in {
      nixosConfigurations."nixos-apple-m2" = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        specialArgs = { inherit inputs theme font; };
        modules = [
          ./hosts/nixos-apple-m2
          ./hosts/common
          home-manager.nixosModules.home-manager
        ];
      };
    };
}
