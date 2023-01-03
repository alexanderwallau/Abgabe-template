{
  description = "Compile LaTeX documents to PDF using nix flakes";
  
  inputs.latex2pdf.url = "github:alexanderwallau/Abgabe-template";

  outputs = { self, latex2pdf }:
    let
      supportedSystems = latex2pdf.inputs.nixpkgs.lib.systems.flakeExposed;
      forAllSystems = latex2pdf.inputs.nixpkgs.lib.genAttrs supportedSystems;
    in
    rec{
      packages = forAllSystems
        (system: {
          default = self.packages.${system}.latex2pdf;
          latex2pdf = latex2pdf.packages.${system}.latex2pdf;
        });
    };
}
