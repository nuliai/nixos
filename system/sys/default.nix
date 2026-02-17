{ ... }:
{
  imports = [
    ./boot.nix
    ./docker.nix
    ./environments.nix
    ./fonts.nix
    ./hardware-configuration.nix
    ./i18n.nix
    ./networking.nix
    ./pipewire.nix
    ./services.nix
    ./plymouth.nix
    ./nix.nix
    ./user.nix
  ];
}
