{ config, pkgs, callPackage, ... }: 

let
  dotfilesSrc = pkgs.fetchFromGitHub {
    owner = "denisse-dev";
    repo = "dotfiles";
    rev = "main";
    sha256 = "TTT0ToLxp4AE0hYeCJpUhokh2/Y3ph+m2CM08+UPBxA=";

  };
in

{

  environment.pathsToLink = [ "/libexec" ]; 

  services.xserver = {
    enable = true;

    desktopManager = {
      xterm.enable = false;
    };
  
      displayManager = {
        defaultSession = "none+i3";
    };
    
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu 
        i3status 
        i3lock
        i3blocks 
        rofi
     ];

      configFile = "${dotfilesSrc}/.config/i3/config";
    };
  };
 
}

