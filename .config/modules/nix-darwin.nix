{ pkgs, ... }:

{
  users.users.tommyhe = {
    name = "tommyhe";
    home = "/Users/tommyhe";
    shell = "zsh";
  };

  nix = {
    package = pkgs.nix;
    configureBuildUsers = true;
    settings.experimental-features = "nix-command flakes repl-flake";
    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };
  };

  programs.zsh = {
    enable = true;
    promptInit = "";
  };

  system.stateVersion = 4;
  # system.activationScripts.postUserActivation = ''
  #   /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
  #   colima start
  # '';



  nixpkgs.hostPlatform = "aarch64-darwin";

  services.nix-daemon.enable = true;
  services.yabai.enable = true;
  services.skhd.enable = true;
  services.postgresql = {
    enable = true;
    dataDir = "/var/lib/postgresql";
  };

  homebrew = {
    enable = true;

    global = {
      brewfile = true;
      lockfiles = true;
    };

    brews = [
      "koekeishiya/formulae/skhd"
      "koekeishiya/formulae/yabai"
    ];


    casks = [
      "appcleaner"
      "zoom"
      "spotify"

      "firefox"
      "google-chrome"
      "orion"

      "notion"
      "raycast"
      "skim"

      "messenger"
      "discord"
      "slack"

      "bitwarden"

      "kitty"

      "microsoft-word"
      "microsoft-excel"
      # "libreoffice"

      "readdle-spark"
      "nuclear"
      "thunderbird"
    ];
  };
}
