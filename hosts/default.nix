{
  lib,
  nixpkgs,
  inputs,
  nur,
  home-manager,
  user,
  name,
  system,
  ...
}: let
  lib = nixpkgs.lib;
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
in {
  desktop = lib.nixosSystem {
    inherit system pkgs;
    specialArgs = {
      inherit inputs user name system;
      host.hostName = "desktop";
    };
    modules = [
      nur.nixosModules.nur
      ./desktop

      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = {
          inherit inputs user;
          host.hostName = "desktop";
        };
        home-manager.users.${user} = {
          imports = [
            ../home/desktop
          ];
        };
      }
    ];
  };
}
