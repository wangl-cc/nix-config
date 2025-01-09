{
  pkgs,
  ...
}:

{
  # User specific configuration
  #
  # Note, this configuration is managed by nix-darwin.
  # There are more user specific configurations managed by home-manager,
  # which is in the file named by user name in this directory.
  users.users.loong = {
    home = "/Users/loong";
  };

  fonts.packages = with pkgs; [
    fira-code
    nerd-fonts.fira-code
    lora
  ];

  # enable nix-darwin integration with fish shell
  programs.fish.enable = true;

  security.pam.enableSudoTouchIdAuth = true;

  system.startup.chime = false;

  # Garbage Collection every moonday at 4:00
  nix.gc = {
    automatic = true;
    interval = {
      Weekday = 0;
      Hour = 4;
      Minute = 0;
    };
    options = "--delete-older-than 30d";
  };

  # Optimise Disk Usage every day at 4:56
  nix.optimise = {
    automatic = true;
    interval = {
      Hour = 4;
      Minute = 56;
    };
  };
}
