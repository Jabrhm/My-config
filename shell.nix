with import <nixpkgs> {};
    mkShell {
        buildInputs = [
            coq
            coqPackages.HoTT
        ];
    }
