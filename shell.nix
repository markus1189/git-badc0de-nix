let pkgs = import <nixpkgs> {};
in with pkgs;

let 
  sources = import ./sources.nix { inherit pkgs; sourcesFile = ./sources.json; };
  src = sources.badc0de;
  drv = with haskell.lib; doJailbreak (justStaticExecutables (haskellPackages.callCabal2nix "git-badc0de" src {}));
in

mkShell {
  buildInputs = [
    drv
  ];
}
