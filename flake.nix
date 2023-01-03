{
  description = "Abgabe Template";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      supportedSystems = nixpkgs.lib.systems.flakeExposed;
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    in
    rec{

      packages = forAllSystems
        (system: {
          default = self.packages.${system}.latex2pdf;
          latex2pdf = let pkgs = nixpkgs.legacyPackages.${system}; in
            pkgs.writeShellScriptBin "latex2pdf" ''
              ${pkgs.neofetch}/bin/neofetch
            '';
        });


      # nix flake init --template 'github:alexanderwallau/Abgabe-template'
      templates.default = self.templates.abgabe-templates;
      templates.abgabe-templates = {
        description = "Abgabe Template";
        path = ./src;
        welcomeText = ''
          # Simple Template for University Assignments
          ## More info
          - [GitHub](https://github.com/alexanderwallau/Abgabe-template/)
        '';
      };

    };
}
