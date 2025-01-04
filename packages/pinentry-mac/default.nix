{
  pkgs,
  ...
}:
let
  pinentry-mac = pkgs.pinentry_mac;
in
{
  home.packages = [
    pinentry-mac
  ];
  services.gpg-agent.pinentryPackage = pinentry-mac;
}
