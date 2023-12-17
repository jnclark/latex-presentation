{
  description = "Reproducible LaTeX Presentation flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
  };

  outputs = { self, nixpkgs, ... }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      texlive-required-packages = pkgs.texlive.combine {
        inherit (pkgs.texlive) scheme-basic latexmk bibtex
          beamer beamertheme-metropolis appendixnumberbeamer
          pgfopts booktabs ccicons xkeyval pgfplots
          mwe metafont fontspec;
      };
    in
    {

      packages.x86_64-linux = {
        default = self.packages.x86_64-linux.full-presentation;
        full-presentation = pkgs.stdenv.mkDerivation {
          name = "slides";
          src = self;
          outputs = [ "out" "handout" "presentation" ];
          buildInputs = [
            texlive-required-packages
          ];
          buildPhase = /* bash */ ''
            export SOURCE_DATE_EPOCH="${toString self.lastModified}"
            export TEXMFHOME="$(mktemp -d)"
            export TEXMFVAR="$TEXMFHOME/texmf-var"
            make
          '';
          installPhase = /* bash */ ''
            mkdir $out
            cp build/handout.pdf $handout
            cp build/presentation.pdf $presentation
            mv build/*.pdf $out
          '';
        };
        presentation = self.packages.x86_64-linux.full-presentation.presentation;
        handout = self.packages.x86_64-linux.full-presentation.handout;
      };

      devShells.x86_64-linux = {
        default = self.devShells.x86_64-linux.present;
        present = pkgs.mkShell {
          packages = with pkgs; [
            pdfpc
          ];
        };
      };

      formatter.x86_64-linux = pkgs.nixpkgs-fmt;

    };
}
