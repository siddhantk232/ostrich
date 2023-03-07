{
  description = "ostrich: os dev for learning purpose";

  outputs = { self, nixpkgs }:
  let pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in
  {
    devShell.x86_64-linux = pkgs.mkShell {
        name = "ostrich";
        buildInputs = with pkgs; [
            nasm
            qemu
            gdb
        ];
    };
    formatter.x86_64-linux = pkgs.nixpkgs-fmt;
  };
}
