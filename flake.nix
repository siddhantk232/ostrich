{
  description = "ostrich: os dev for learning purpose";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";


  outputs = { self, nixpkgs }:
  let pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in
  {
    devShell.x86_64-linux = pkgs.mkShell {
        name = "ostrich";
        buildInputs = with pkgs; [
            nasm
            qemu
        ];
    };
    formatter.x86_64-linux = pkgs.nixpkgs-fmt;
  };
}
