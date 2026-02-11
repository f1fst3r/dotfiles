{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
    nvim-config.url = "github:nix-community/kickstart-nix.nvim";
  };

  outputs =
    {
      self,
      nixpkgs,
      sops-nix,
      nvim-config,
    }:
    {

      # Set Host Configs
      nixosConfigurations = {
        pc = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            sops-nix.nixosModules.sops
            ./users/fmg/user.nix
            ./users/tgj/user.nix
            ./modules/modules.nix
            ./hosts/pc/pc.nix

	    ({ pkgs, ... }: {
		nixpkgs.overlays = [
			nvim-config.overlays.default
		];
	    })

          ];
        };

      };
    };
}
