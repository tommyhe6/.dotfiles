{ pkgs, ... }:

{
  users.users.tommyhe = {
    name = "tommyhe";
    home = "/Users/tommyhe";
    shell = "zsh";
  };

  nix = {
    package = pkgs.nixVersions.latest;
    configureBuildUsers = true;
    settings.experimental-features = "nix-command flakes";
    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };
    optimise = {
        automatic = true;
    };
  };

  programs.zsh = {
    enable = true;
    promptInit = "";
  };

  system.stateVersion = 4;

  nixpkgs.hostPlatform = "aarch64-darwin";

  services.nix-daemon.enable = true;
  services.yabai.enable = true;
  services.skhd.enable = true;

  homebrew = {
    enable = true;

    global = {
      brewfile = true;
      lockfiles = true;
      autoUpdate = false;
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

      "alacritty"
      "1password"

      "microsoft-word"
      "microsoft-excel"
      "microsoft-powerpoint"
      # "libreoffice" fails for some reason

      "minecraft"

      "rancher"
    ];
  };
}
