{
  inputs = {
    hyprland.url = "github:hyprwm/Hyprland";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    ags.url = "github:Aylur/ags";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      # home-manager,
      ...
    }@inputs:
    let
      pkgs = import nixpkgs {
        system = "x86_64-linux";

        config = {
          allowUnfree = true;
        };
      };
    in
    {
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit pkgs; };
          modules = [
            inputs.home-manager.nixosModules.default
            ./hosts/desktop/configuration.nix
          ];
        };
        laptop = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit pkgs; };
          modules = [
            inputs.home-manager.nixosModules.default

            ./hosts/laptop/configuration.nix
          ];
        };
      };
      # homeConfigurations = {
      #   sepp = home-manager.lib.homeManagerConfiguration {
      #     pkgs = import nixpkgs { system = "x86_64-linux"; };
      #     modules = [ ./hosts/laptop/home.nix ];
      #     username = "sepp";
      #     homeDirectory = "/home/sepp";
      #   };
      # };
    };
}
