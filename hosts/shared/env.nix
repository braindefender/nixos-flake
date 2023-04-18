{ lib, pkgs, ... }:

{
  environment = with pkgs; {
    variables = {
      VISUAL = "nvim";
      EDITOR = "nvim";
      BROWSER = "firefox";
      TERMINAL = "kitty";
    };

    binsh = lib.getExe bash;
    shells = [zsh];
    pathsToLink = [ "/share/zsh" ];

    loginShellInit = ''
      dbus-update-activation-environment --all
      eval $(gnome-keyring-daemon --start --daemonize --components=pkcs11,secrets,ssh)
      eval $(ssh-agent)
    '';
  };
}
