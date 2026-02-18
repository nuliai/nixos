{
  description = "A simple NixOS flake";
  inputs = {
    # NixOS 官方软件源，这里使用 nixos-25.05 分支
    nixpkgs.url = "nixpkgs/nixos-unstable";
    quickshell = {
      url = "git+https://git.outfoxxed.me/quickshell/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
    myNixpkgs = {
      url = "git+https://gitee.com/binigo/nixos-repo-of-binigo.git";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      userName = "nuli";
      hostName = "nixos";
    in
    {
      nixosConfigurations.${hostName} = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
        specialArgs = {
          # pkgs-stable = import nixpkgs-stable {
          #   inherit system;
          #   config.allowUnfree = true;
          # };
          my-pkgs = inputs.myNixpkgs.packages.${system};
          inherit
            self
            inputs
            userName
            hostName
            ;
        };
        modules = [
          ./host/configuration.nix
          inputs.home-manager.nixosModules.default

        ];
      };
    };
}
