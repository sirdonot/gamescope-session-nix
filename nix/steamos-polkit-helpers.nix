{ pkgs }:

let
  modules = import ./helper-modules.nix { inherit pkgs; };

  steam-http-loader = pkgs.writeTextFile {
    name = "steam-http-loader";
    executable = true;
    destination = "/bin/steam-http-loader";
    text = ''
      #!${pkgs.python3}/bin/python3
      import urllib.parse
      import os.path
      import argparse
      import subprocess

      def run(action, arg):
          final_url = "steam://{0}/{1}".format(action, arg)
          subprocess.run(["steam", final_url])

      def main():
          parser = argparse.ArgumentParser(description='Launch a link in the steam browser.')
          parser.add_argument('uri')
          args = parser.parse_args()

          uri = args.uri

          url = urllib.parse.urlparse(uri, "file")

          # convert mailto://A@b.com to steam://mailto/A@b.com
          if (url.scheme == 'mailto'):
              run('mailto', url.path or url.netloc)
              return

          # open any other URL, converting paths to full file URIs
          if (url.scheme == 'file' and not os.path.isabs(url.path)):
              absolute_path = os.path.abspath(url.path)
              url = url._replace(path=absolute_path)
          run('openurl_external', url.geturl())
          return

      main()
    '';
  };

  steam-http-loader-desktop = pkgs.writeTextFile {
    name = "steam-http-loader-desktop";
    executable = true;
    destination = "/share/applications/steam-http-loader.desktop";
    text = ''
      [Desktop Entry]
      Type=Application
      Name=Steam HTTP Handler
      NoDisplay=true
      Exec=${steam-http-loader}/bin/steam-http-loader %u
    '';
  };

  gamescope-mimeapps = pkgs.writeTextFile {
    name = "gamescope-mimeapps";
    destination = "/share/applications/gamescope-mimeapps.list";
    text = ''
      [Default Applications]
      x-scheme-handler/http=${steam-http-loader-desktop}/share/applications/steam_http_loader.desktop
      x-scheme-handler/https=${steam-http-loader-desktop}/share/applications/steam_http_loader.desktop
      x-scheme-handler/mailto=${steam-http-loader-desktop}/share/applications/steam_http_loader.desktop
      application/pdf=${steam-http-loader-desktop}/share/applications/steam_http_loader.desktop
      application/x-extension-html=${steam-http-loader-desktop}/share/applications/steam_http_loader.desktop
      text/html=${steam-http-loader-desktop}/share/applications/steam_http_loader.desktop
    '';
  };
in
{
  inherit steam-http-loader steam-http-loader-desktop gamescope-mimeapps;

  jupiter-amp-control = pkgs.writeTextFile {
    name = "jupiter-amp-control";
    executable = true;
    destination = "/bin/steamos-polkit-helpers/jupiter-amp-control";
    text = ''
      #!${pkgs.bash}/bin/bash

      # Exit immediately on error and throw an error
      # when using undefined variables
      set -eu

      exec ${modules.jupiterAmpControl}/lib/hwsupport/jupiter-amp-control "$@"
    '';
  };
  jupiter-biosupdate = pkgs.writeTextFile {
    name = "jupiter-biosupdate";
    executable = true;
    destination = "/bin/steamos-polkit-helpers/jupiter-biosupdate";
    text = ''
      #!${pkgs.bash}/bin/bash

      # Exit immediately on error and throw an error
      # when using undefined variables
      set -eu

      # Sike!  This is so the steam interface that originally wanted jupiter-biosupdate triggers the whole firmware update
      # logic, which will call back to jupiter-biosupdate on necessary devices.
      #
      # This should all be moved to steamos-manager
      exec ${modules.jupiterBiosupdate}/bin/jupiter-biosupdate "$@"
    '';
  };
  jupiter-check-support = pkgs.writeTextFile {
    name = "jupiter-check-support";
    executable = true;
    destination = "/bin/steamos-polkit-helpers/jupiter-check-support";
    text = ''
      #!${pkgs.bash}/bin/bash

      # Exit immediately on error and throw an error
      # when using undefined variables
      set -eu

      echo "Supported: no"
      exit 0
    '';
  };
  jupiter-dock-updater = pkgs.writeTextFile {
    name = "jupiter-dock-updater";
    executable = true;
    destination = "/bin/steamos-polkit-helpers/jupiter-dock-updater";
    text = ''
      #!${pkgs.bash}/bin/bash

      # Exit immediately on error and throw an error
      # when using undefined variables
      set -eu

      exec ${modules.jupiterDockUpdater}/lib/jupiter-dock-updater/jupiter-dock-updater "$@"
    '';
  };
  jupiter-fan-control = pkgs.writeTextFile {
    name = "jupiter-fan-control";
    executable = true;
    destination = "/bin/steamos-polkit-helpers/jupiter-fan-control";
    text = ''
      #!${pkgs.bash}/bin/bash

      # Exit immediately on error and throw an error
      # when using undefined variables
      set -eu

      echo "Unavailable on this Hardware."
      exit 22
    '';
  };
  jupiter-get-als-gain = pkgs.writeTextFile {
    name = "jupiter-get-als-gain";
    executable = true;
    destination = "/bin/steamos-polkit-helpers/jupiter-get-als-gain";
    text = ''
      #!${pkgs.bash}/bin/bash

      # Exit immediately on error and throw an error
      # when using undefined variables
      set -eu

      echo "Unavailable on this Hardware."
      exit 22
    '';
  };

  # now the steamos-stuff
  steamos-devkit-mode = pkgs.writeTextFile {
    name = "steamos-devkit-mode";
    executable = true;
    destination = "/bin/steamos-polkit-helpers/steamos-devkit-mode";
    text = ''
      #!${pkgs.bash}/bin/bash

      # Exit immediately on error and throw an error
      # when using undefined variables
      set -eu

      echo "Unavailable on this Hardware."
      exit 22
    '';
  };
  steamos-disable-wireless-power-management = pkgs.writeTextFile {
    name = "steamos-disable-wireless-power-manager";
    executable = true;
    destination = "/bin/steamos-polkit-helpers/steamos-disable-wireless-power-management";
    text = ''
      #!${pkgs.bash}/bin/bash

      # Exit immediately on error and throw an error
      # when using undefined variables
      set -eu
    '';
  };
  steamos-enable-sshd = pkgs.writeTextFile {
    name = "steamos-enable-sshd";
    executable = true;
    destination = "/bin/steamos-polkit-helpers/steamos-enable-sshd";
    text = ''
      #!${pkgs.bash}/bin/bash

      # Exit immediately on error and throw an error
      # when using undefined variables
      set -eu

      # exec systemctl enable --now sshd
    '';
  };
  steamos-factory-reset-config = pkgs.writeTextFile {
    name = "steamos-factory-reset-config";
    executable = true;
    destination = "/bin/steamos-polkit-helpers/steamos-factory-reset-config";
    text = ''
      #!${pkgs.bash}/bin/bash

      # Exit immediately on error and throw an error
      # when using undefined variables
      set -eu

      exec ${modules.steamosFactoryReset}/bin/steamos-factory-reset-config "$@"
    '';
  };
  steamos-format-device = pkgs.writeTextFile {
    name = "steamos-format-device";
    executable = true;
    destination = "/bin/steamos-polkit-helpers/steamos-format-device";
    text = ''
      #!${pkgs.bash}/bin/bash

      # Exit immediately on error and throw an error
      # when using undefined variables
      set -eu

      exec ${modules.formatDevice}/lib/hwsupport/format-device "$@"
    '';
  };
  steamos-format-sdcard = pkgs.writeTextFile {
    name = "steamos-format-sdcard";
    executable = true;
    destination = "/bin/steamos-polkit-helpers/steamos-format-sdcard";
    text = ''
      #!${pkgs.bash}/bin/bash

      # Exit immediately on error and throw an error
      # when using undefined variables
      set -eu

      exec ${modules.formatSDCard}/lib/hwsupport/format-sdcard "$@"
    '';
  };
  steamos-poweroff-now = pkgs.writeTextFile {
    name = "steamos-poweroff-now";
    executable = true;
    destination = "/bin/steamos-polkit-helpers/steamos-poweroff-now";
    text = ''
      #!${pkgs.bash}/bin/bash

      # Exit immediately on error and throw an error
      # when using undefined variables
      set -eu

      poweroff
    '';
  };
  steamos-priv-write = pkgs.writeTextFile {
    name = "steamos-priv-write";
    executable = true;
    destination = "/bin/steamos-polkit-helpers/steamos-priv-write";
    text = ''
      #!${pkgs.bash}/bin/bash

      set -euo pipefail
      shopt -s nullglob

      echo "Unavailable on this Hardware."
      exit 1
    '';
  };
  steamos-reboot-now = pkgs.writeTextFile {
    name = "steamos-reboot-now";
    executable = true;
    destination = "/bin/steamos-polkit-helpers/steamos-reboot-now";
    text = ''
      #!${pkgs.bash}/bin/bash

      # Exit immediately on error and throw an error
      # when using undefined variables
      set -eu

      reboot
    '';
  };
  steamos-reboot-other = pkgs.writeTextFile {
    name = "steamos-reboot-other";
    executable = true;
    destination = "/bin/steamos-polkit-helpers/steamos-reboot-other";
    text = ''
      #!${pkgs.bash}/bin/bash

      # Exit immediately on error and throw an error
      # when using undefined variables
      set -eu

      exec ${modules.steamosReboot}/bin/steamos-reboot --reboot-other
    '';
  };
  steamos-select-branch = pkgs.writeTextFile {
    name = "steamos-select-branch";
    executable = true;
    destination = "/bin/steamos-polkit-helpers/steamos-select-branch";
    text = ''
      #!${pkgs.bash}/bin/bash

      # Exit immediately on error and throw an error
      # when using undefined variables
      set -eu

      exec ${modules.steamosSelectBranch}/bin/steamos-select-branch "$@"
    '';
  };
  steamos-session-select = pkgs.writeTextFile {
    name = "steamos-session-select";
    executable = true;
    destination = "/bin/steamos-session-select";
    text = ''
      #!${pkgs.bash}/bin/bash

      # Exit immediately on error and throw an error
      # when using undefined variables
      set -eu

      # Shutting down Steam will return to the terminal, 
      # desktop environment or the login screen (display manager)
      # depending on where Steam was launched.

      steam -shutdown
    '';
  };
  steamos-set-hostname = pkgs.writeTextFile {
    name = "steamos-set-hostname";
    executable = true;
    destination = "/bin/steamos-polkit-helpers/steamos-set-hostname";
    text = ''
      #!${pkgs.bash}/bin/bash

      # Exit immediately on error and throw an error
      # when using undefined variables
      set -eu

      hostnamectl set-hostname "$1"
    '';
  };
  steamos-set-timezone = pkgs.writeTextFile {
    name = "steamos-set-timezone";
    executable = true;
    destination = "/bin/steamos-polkit-helpers/steamos-set-timezone";
    text = ''
      #!${pkgs.bash}/bin/bash

      # Exit immediately on error and throw an error
      # when using undefined variables
      set -eu

      timedatectl set-timezone "$1"
    '';
  };
  steamos-trim-devices = pkgs.writeTextFile {
    name = "steamos-trim-devices";
    executable = true;
    destination = "/bin/steamos-polkit-helpers/steamos-trim-devices";
    text = ''
      #!${pkgs.bash}/bin/bash

      # Exit immediately on error and throw an error
      # when using undefined variables
      set -eu

      exec ${modules.trimDevices}/lib/hwsupport/trim-devices "$@"
    '';
  };
  steamos-update = pkgs.writeTextFile {
    name = "steamos-update";
    executable = true;
    destination = "/bin/steamos-polkit-helpers/steamos-update";
    text = ''
      #!${pkgs.bash}/bin/bash

      # Exit immediately on error and throw an error
      # when using undefined variables
      set -eu

      exec ${modules.steamosUpdate}/bin/steamos-update "$@"
    '';
  };
}
