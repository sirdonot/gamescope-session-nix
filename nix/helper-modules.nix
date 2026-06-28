{ pkgs }:

{
  jupiterAmpControl = pkgs.writeTextFile {
    name = "jupiter-amp-control";
    executable = true;
    destination = "/lib/hwsupport/jupiter-amp-control";
    text = ''
      #!${pkgs.bash}/bin/bash

      echo "Unavailable on this Hardware."
      exit 0
    '';
  };

  jupiterBiosupdate = pkgs.writeTextFile {
    name = "jupiter-biosupdate";
    executable = true;
    destination = "/bin/jupiter-biosupdate";
    text = ''
      #!${pkgs.bash}/bin/bash

      # As this is running on a standard Linux install
      # state that no updates configured for this bios
      # and exit
      echo "Unavailable on NixOS"
      exit 0
    '';
  };

  jupiterDockUpdater = pkgs.writeTextFile {
    name = "jupiter-dock-updater";
    executable = true;
    destination = "/lib/jupiter-dock-updater/jupiter-dock-updater";
    text = ''
      #!${pkgs.bash}/bin/bash

      echo "Unavailable on this Hardware."
      exit 0
    '';
  };

  steamosFactoryReset = pkgs.writeTextFile {
    name = "steamos-factory-reset-config";
    executable = true;
    destination = "/bin/steamos-factory-reset-config";
    text = ''
      #!${pkgs.bash}/bin/bash

      echo "Unavailable on this Hardware."
      exit 0
    '';
  };

  formatDevice = pkgs.writeTextFile {
    name = "format-device";
    executable = true;
    destination = "/lib/hwsupport/format-device";
    text = ''
      #!${pkgs.bash}/bin/bash

      echo "Unavailable on this Hardware."
      exit 0
    '';
  };

  formatSDCard = pkgs.writeTextFile {
    name = "format-sdcard";
    executable = true;
    destination = "/lib/hwsupport/format-sdcard";
    text = ''
      #!${pkgs.bash}/bin/bash

      # No need to set this in nixos really so
      # it just exits, no5

      echo "Unavailable on this Hardware."
      exit 0
    '';
  };

  steamosReboot = pkgs.writeTextFile {
    name = "steamos-reboot";
    executable = true;
    destination = "/bin/steamos-reboot";
    text = ''
      #!${pkgs.bash}/bin/bash

      echo "Unavailable on this Hardware."
      exit 0
    '';
  };

  trimDevices = pkgs.writeTextFile {
    name = "trim-devices";
    executable = true;
    destination = "/lib/hwsupport/trim-devices";
    text = ''
      #!${pkgs.bash}/bin/bash

      echo "Unavailable on this Hardware."
      exit 0
    '';
  };

  steamosSelectBranch = pkgs.writeTextFile {
    name = "steamos-select-branch";
    executable = true;
    destination = "/bin/steamos-select-branch";
    text = ''
      #!${pkgs.bash}/bin/bash

      echo "Unavailable on NixOS."
    '';
  };

  steamosUpdate = pkgs.writeTextFile {
    name = "steamos-update";
    executable = true;
    destination = "/bin/steamos-update";
    text = ''
      #!${pkgs.bash}/bin/bash

      # Steam client updates are managed separately,
      # so in this case return exit code 7 stating 
      # no system updates.
      exit 7;
    '';
  };
}
