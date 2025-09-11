{ config, pkgs, ... }:
{
  # Create user
  users.users.fmg = {
    isNormalUser = true;
    description = "FMG";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];

    openssh.authorizedKeys.keys = [
      (builtins.readFile ./public-keys/id_me.pub)
    ];

    packages = with pkgs; [ ];
  };
}
