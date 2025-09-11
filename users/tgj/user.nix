{ config, pkgs, ... }:
{
  users.users.tgj = {
    isNormalUser = true;
    description = "TGJ";
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
