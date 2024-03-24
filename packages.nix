{ config, pkgs, ... }:
{
services.flatpak.enable = true;
  users.users.roronoa = {
    isNormalUser = true;
    description = "roronoa";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
      vim
      git
      vscode
      
      google-chrome
      
      gnomeExtensions.pano
      libnotify
      github-desktop
      
    #  thunderbird
    ];
  };
}
