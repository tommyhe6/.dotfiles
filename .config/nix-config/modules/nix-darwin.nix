{ pkgs, ... }:

{
  users.users.tommyhe = {
    name = "tommyhe";
    home = "/Users/tommyhe";
    # shell = "zsh";
  };

  nix = {
    package = pkgs.nixVersions.latest;
    # configureBuildUsers = true;
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
  system.primaryUser = "tommyhe";

  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;

  # services.nix-daemon.enable = true;
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
      # "koekeishiya/formulae/skhd"
      # "koekeishiya/formulae/yabai"
    ];


    casks = [
      "appcleaner"
      "zoom"
      "spotify"

      "firefox"
      "google-chrome"
      "microsoft-edge"

      "notion"
      "raycast"
      "skim"

      "messenger"
      "discord"
      "slack"
      "whatsapp@beta"
      "signal"

      "bitwarden"
      "alacritty"
      "1password"

      "mullvadvpn"
      "adobe-acrobat-reader"
      "microsoft-auto-update"
      # "microsoft-word"
      "microsoft-excel"
      "onedrive"
      # "microsoft-powerpoint"
      # "libreoffice" fails for some reason

      "minecraft"

      "rancher"

      "cursor"
      "vlc"

      "burp-suite"
    ];
  };
}
