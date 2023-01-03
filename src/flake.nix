{
  description = "Compile LaTeX documents to PDF using nix flakes";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.latex2pdf.url = "github:alexanderwallau/Abgabe-template";
  inputs.latex2pdf.follows = "nixpkgs";

  outputs = { self, nixpkgs, latex2pdf }:
    let
      supportedSystems = nixpkgs.lib.systems.flakeExposed;
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    in
    rec{
      packages = forAllSystems
        (system: {
          default = self.packages.${system}.latex2pdf;
          latex2pdf = latex2pdf.packages.${system}.latex2pdf;
        });
    };
}
