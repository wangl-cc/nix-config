{
  description = "My System and User configurations using nix-darwin and home-manager";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nix-darwin,
      home-manager,
      nixpkgs,
      ...
    }@inputs:
    let
      lib = nixpkgs.lib;
      mkDarwinConfig =
        host:
        { system }:
        nix-darwin.lib.darwinSystem {
          specialArgs = {
            inherit inputs;
          };
          modules = [
            {
              nix.settings.experimental-features = [
                "nix-command"
                "flakes"
              ];
              nix.nixPath = [ "nixpkgs=${nixpkgs}" ];
              nixpkgs.hostPlatform = system;
              system.stateVersion = 5;
            }
            ./hosts/${host}
          ];
        };
      mkHmConfig =
        userWithHost:
        { system }:
        let
          matches = builtins.match "^(.*)@(.*)$" userWithHost;
          user = builtins.elemAt matches 0;
          host = builtins.elemAt matches 1;
          homeDir = if lib.hasSuffix "darwin" system then "/Users/${user}" else "/home/${user}";
        in
        home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { inherit system; };
          extraSpecialArgs = {
            hmConfigPath = "${homeDir}/.config/home-manager";
          };
          modules = [
            # default configuration for home-manager
            {
              home.username = user;
              home.homeDirectory = homeDir;
              home.stateVersion = "24.11";
              programs.home-manager.enable = true;
            }
            ./hosts/${host}/${user}.nix
          ];
        };
    in
    {
      # NOTE:
      # The nix-darwin and home-manager use the different way to get hostname
      # For nix-darwin, it uses the `scutil --get LocalHostName`
      # while home-manager uses the `hostname -s` command from inetutils
      # For scutil, it returns the LocalHostName with original case
      # but for hostname, it returns the hostname in lowercase
      # So, to make sure the hostname is consistent
      # We should always set the hostname in lowercase
      darwinConfigurations = lib.mapAttrs mkDarwinConfig {
        loongmbpm1.system = "aarch64-darwin";
      };
      homeConfigurations = lib.mapAttrs mkHmConfig {
        "loong@loongmbpm1".system = "aarch64-darwin";
      };
    };
}
