{
  outputs = { self, nixpkgs }:
    {
      apps = nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed
        (system:
          let pkgs = import nixpkgs { inherit system; }; in
          {
            default = pkgs.${PACKAGE};
          }
        );
    };
}
