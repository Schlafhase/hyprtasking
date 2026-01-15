{
  description = "Hyprtasking";

  inputs = {
    hyprland.url = "github:hyprwm/Hyprland";
    nixpkgs.follows = "hyprland/nixpkgs";
    systems.url = "github:nix-systems/default-linux";
  };

  outputs = {
    self,
    nixpkgs,
    hyprland,
    systems,
    ...
  }: let
    inherit (nixpkgs) lib;

    forSystems = attrs:
      lib.genAttrs (import systems) (
        system:
          attrs system nixpkgs.legacyPackages.${system}
      );
  in {
    packages = forSystems (system: pkgs: {
      hyprtaskingStable = pkgs.callPackage ./nix/package.nix {};
      hyprtasking = pkgs.callPackage ./nix/package.nix {hyprland = hyprland.packages.${system}.default;};
      default = self.packages.${system}.hyprtasking;
    });
  };
}
