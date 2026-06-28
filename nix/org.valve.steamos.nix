{ pkgs }:

let
  helpers = import ./steamos-polkit-helpers.nix { inherit pkgs; };
in
{
  valve-steamos-policy = pkgs.writeTextFile {
    name = "valve-steamos-policy";
    destination = "/share/polkit-1/actions/org.valve.steamos.policy";
    text = ''
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE policyconfig PUBLIC
      "-//freedesktop//DTD PolicyKit Policy Configuration 1.0//EN"
      "http://www.freedesktop.org/standards/PolicyKit/1/policyconfig.dtd">
      <policyconfig>

        <vendor>Valve SteamOS</vendor>
        <vendor_url>http://www.steampowered.com</vendor_url>

        <action id="org.valve.policykit.steamos.pkexec.run-steamos-polkit-helpers-steamos-format-sdcard">
          <description>Run the steamos sdcard helper</description>
          <icon_name>package-x-generic</icon_name>
          <defaults>
            <allow_any>yes</allow_any>
            <allow_inactive>yes</allow_inactive>
            <allow_active>yes</allow_active>
          </defaults>
          <annotate key="org.freedesktop.policykit.exec.path">${helpers.steamos-format-sdcard}/bin/steamos-polkit-helpers/steamos-format-sdcard</annotate>
        </action>

        <action id="org.valve.policykit.steamos.pkexec.run-steamos-polkit-helpers-steamos-format-device">
          <description>Run the steamos storage device helper</description>
          <icon_name>package-x-generic</icon_name>
          <defaults>
            <allow_any>yes</allow_any>
            <allow_inactive>yes</allow_inactive>
            <allow_active>yes</allow_active>
          </defaults>
          <annotate key="org.freedesktop.policykit.exec.path">${helpers.steamos-format-device}/bin/steamos-polkit-helpers/steamos-format-device</annotate>
        </action>

        <action id="org.valve.policykit.steamos.pkexec.run-steamos-polkit-helpers-steamos-trim-devices">
          <description>Run the steamos trim storage devices helper</description>
          <icon_name>package-x-generic</icon_name>
          <defaults>
            <allow_any>yes</allow_any>
            <allow_inactive>yes</allow_inactive>
            <allow_active>yes</allow_active>
          </defaults>
          <annotate key="org.freedesktop.policykit.exec.path">${helpers.steamos-trim-devices}/bin/steamos-polkit-helpers/steamos-trim-devices</annotate>
        </action>

        <action id="org.valve.policykit.steamos.pkexec.run-steamos-polkit-helpers-steamos-reboot-other">
          <description>Run the steamos reboot helper</description>
          <icon_name>package-x-generic</icon_name>
          <defaults>
            <allow_any>yes</allow_any>
            <allow_inactive>yes</allow_inactive>
            <allow_active>yes</allow_active>
          </defaults>
          <annotate key="org.freedesktop.policykit.exec.path">${helpers.steamos-reboot-other}/bin/steamos-polkit-helpers/steamos-reboot-other</annotate>
        </action>

        <action id="org.valve.policykit.steamos.pkexec.run-steamos-polkit-helpers-steamos-select-branch">
          <description>Run the steamos select branch helper</description>
          <icon_name>package-x-generic</icon_name>
          <defaults>
            <allow_any>yes</allow_any>
            <allow_inactive>yes</allow_inactive>
            <allow_active>yes</allow_active>
          </defaults>
          <annotate key="org.freedesktop.policykit.exec.path">${helpers.steamos-select-branch}/bin/steamos-polkit-helpers/steamos-select-branch</annotate>
        </action>

        <action id="org.valve.policykit.steamos.pkexec.run-steamos-polkit-helpers-steamos-update">
          <description>Run the steamos update helper</description>
          <icon_name>package-x-generic</icon_name>
          <defaults>
            <allow_any>yes</allow_any>
            <allow_inactive>yes</allow_inactive>
            <allow_active>yes</allow_active>
          </defaults>
          <annotate key="org.freedesktop.policykit.exec.path">${helpers.steamos-update}/bin/steamos-polkit-helpers/steamos-update</annotate>
        </action>

        <action id="org.valve.policykit.steamos.pkexec.run-steamos-polkit-helpers/jupiter-biosupdate">
          <description>Run the jupiter bios update helper</description>
          <icon_name>package-x-generic</icon_name>
          <defaults>
            <allow_any>yes</allow_any>
            <allow_inactive>yes</allow_inactive>
            <allow_active>yes</allow_active>
          </defaults>
          <annotate key="org.freedesktop.policykit.exec.path">${helpers.jupiter-biosupdate}/bin/steamos-polkit-helpers/jupiter-biosupdate</annotate>
        </action>

        <action id="org.valve.policykit.steamos.pkexec.run-steamos-polkit-helpers-steamos-factory-reset-config">
          <description>Run the steamos factory reset helper</description>
          <icon_name>package-x-generic</icon_name>
          <defaults>
            <allow_any>yes</allow_any>
            <allow_inactive>yes</allow_inactive>
            <allow_active>yes</allow_active>
          </defaults>
          <annotate key="org.freedesktop.policykit.exec.path">${helpers.steamos-factory-reset-config}/bin/steamos-polkit-helpers/steamos-factory-reset-config</annotate>
        </action>

        <action id="org.valve.policykit.steamos.pkexec.run-steamos-polkit-helpers/jupiter-get-als-gain">
          <description>Get the jupiter ALS gain calibration data from bios</description>
          <icon_name>package-x-generic</icon_name>
          <defaults>
            <allow_any>yes</allow_any>
            <allow_inactive>yes</allow_inactive>
            <allow_active>yes</allow_active>
          </defaults>
          <annotate key="org.freedesktop.policykit.exec.path">${helpers.jupiter-get-als-gain}/bin/steamos-polkit-helpers/jupiter-get-als-gain</annotate>
        </action>

        <action id="org.valve.policykit.steamos.pkexec.run-steamos-polkit-helpers-steamos-set-hostname">
          <description>Set the hostname</description>
          <icon_name>package-x-generic</icon_name>
          <defaults>
            <allow_any>yes</allow_any>
            <allow_inactive>yes</allow_inactive>
            <allow_active>yes</allow_active>
          </defaults>
          <annotate key="org.freedesktop.policykit.exec.path">${helpers.steamos-set-hostname}/bin/steamos-polkit-helpers/steamos-set-hostname</annotate>
        </action>

        <action id="org.valve.policykit.steamos.pkexec.run-steamos-polkit-helpers-steamos-set-timezone">
          <description>Set the timezone</description>
          <icon_name>package-x-generic</icon_name>
          <defaults>
            <allow_any>yes</allow_any>
            <allow_inactive>yes</allow_inactive>
            <allow_active>yes</allow_active>
          </defaults>
          <annotate key="org.freedesktop.policykit.exec.path">${helpers.steamos-set-timezone}/bin/steamos-polkit-helpers/steamos-set-timezone</annotate>
        </action>

        <action id="org.valve.policykit.steamos.pkexec.run-steamos-polkit-helpers-steamos-priv-write">
          <description>Helper to write to a set of device nodes</description>
          <icon_name>package-x-generic</icon_name>
          <defaults>
            <allow_any>yes</allow_any>
            <allow_inactive>yes</allow_inactive>
            <allow_active>yes</allow_active>
          </defaults>
          <annotate key="org.freedesktop.policykit.exec.path">${helpers.steamos-priv-write}/bin/steamos-polkit-helpers/steamos-priv-write</annotate>
        </action>

        <action id="org.valve.policykit.steamos.pkexec.run-session-select">
          <description>Helper to switch sessions</description>
          <icon_name>package-x-generic</icon_name>
          <defaults>
            <allow_any>yes</allow_any>
            <allow_inactive>yes</allow_inactive>
            <allow_active>yes</allow_active>
          </defaults>
          <annotate key="org.freedesktop.policykit.exec.path">${helpers.steamos-session-select}/bin/steamos-session-select</annotate>
        </action>

        <action id="org.valve.policykit.steamos.pkexec.run-steamos-polkit-helpers-steamos-reboot-now">
          <description>Reboot system</description>
          <icon_name>package-x-generic</icon_name>
          <defaults>
            <allow_any>yes</allow_any>
            <allow_inactive>yes</allow_inactive>
            <allow_active>yes</allow_active>
          </defaults>
          <annotate key="org.freedesktop.policykit.exec.path">${helpers.steamos-reboot-now}/bin/steamos-polkit-helpers/steamos-reboot-now</annotate>
        </action>

        <action id="org.valve.policykit.steamos.pkexec.run-steamos-polkit-helpers-steamos-poweroff-now">
          <description>Poweroff system</description>
          <icon_name>package-x-generic</icon_name>
          <defaults>
            <allow_any>yes</allow_any>
            <allow_inactive>yes</allow_inactive>
            <allow_active>yes</allow_active>
          </defaults>
          <annotate key="org.freedesktop.policykit.exec.path">${helpers.steamos-poweroff-now}/bin/steamos-polkit-helpers/steamos-poweroff-now</annotate>
        </action>

        <action id="org.valve.policykit.steamos.pkexec.run-steamos-polkit-helpers-steamos-enable-sshd">
          <description>Enable the SSH server</description>
          <icon_name>package-x-generic</icon_name>
          <defaults>
            <allow_any>yes</allow_any>
            <allow_inactive>yes</allow_inactive>
            <allow_active>yes</allow_active>
          </defaults>
          <annotate key="org.freedesktop.policykit.exec.path">${helpers.steamos-enable-sshd}/bin/steamos-polkit-helpers/steamos-enable-sshd</annotate>
        </action>

        <action id="org.valve.policykit.steamos.pkexec.run-steamos-polkit-helpers-steamos-disable-wireless-power-management">
          <description>Disable wireless power management</description>
          <icon_name>package-x-generic</icon_name>
          <defaults>
            <allow_any>yes</allow_any>
            <allow_inactive>yes</allow_inactive>
            <allow_active>yes</allow_active>
          </defaults>
          <annotate key="org.freedesktop.policykit.exec.path">${helpers.steamos-disable-wireless-power-management}/bin/steamos-polkit-helpers/steamos-disable-wireless-power-management</annotate>
        </action>

        <action id="org.valve.policykit.steamos.pkexec.run-steamos-polkit-helpers/jupiter-fan-control">
          <description>Fan control service management</description>
          <icon_name>package-x-generic</icon_name>
          <defaults>
            <allow_any>yes</allow_any>
            <allow_inactive>yes</allow_inactive>
            <allow_active>yes</allow_active>
          </defaults>
          <annotate key="org.freedesktop.policykit.exec.path">${helpers.jupiter-fan-control}/bin/steamos-polkit-helpers/jupiter-fan-control</annotate>
        </action>

        <action id="org.valve.policykit.steamos.pkexec.run-steamos-polkit-helpers/jupiter-amp-control">
          <description>Audio amp tweaks</description>
          <icon_name>package-x-generic</icon_name>
          <defaults>
            <allow_any>yes</allow_any>
            <allow_inactive>yes</allow_inactive>
            <allow_active>yes</allow_active>
          </defaults>
          <annotate key="org.freedesktop.policykit.exec.path">${helpers.jupiter-amp-control}/bin/steamos-polkit-helpers/jupiter-amp-control</annotate>
        </action>

        <action id="org.valve.policykit.steamos.pkexec.run-steamos-polkit-helpers/steamos-devkit-mode">
          <description>Control devkit services</description>
          <icon_name>package-x-generic</icon_name>
          <defaults>
            <allow_any>yes</allow_any>
            <allow_inactive>yes</allow_inactive>
            <allow_active>yes</allow_active>
          </defaults>
          <annotate key="org.freedesktop.policykit.exec.path">${helpers.steamos-devkit-mode}/bin/steamos-polkit-helpers/steamos-devkit-mode</annotate>
        </action>

        <action id="org.valve.policykit.steamos.pkexec.run-steamos-polkit-helpers-jupiter-dock-updater">
          <description>Run the jupiter dock updater</description>
          <icon_name>package-x-generic</icon_name>
          <defaults>
            <allow_any>yes</allow_any>
            <allow_inactive>yes</allow_inactive>
            <allow_active>yes</allow_active>
          </defaults>
          <annotate key="org.freedesktop.policykit.exec.path">${helpers.jupiter-dock-updater}/bin/steamos-polkit-helpers/jupiter-dock-updater</annotate>
        </action>

        <action id="org.valve.policykit.steamos.pkexec.run-steamos-polkit-helpers-jupiter-check-support">
          <description>Checks if the current prototype is supported</description>
          <icon_name>package-x-generic</icon_name>
          <defaults>
            <allow_any>yes</allow_any>
            <allow_inactive>yes</allow_inactive>
            <allow_active>yes</allow_active>
          </defaults>
          <annotate key="org.freedesktop.policykit.exec.path">${helpers.jupiter-check-support}/bin/steamos-polkit-helpers/jupiter-check-support</annotate>
        </action>

      </policyconfig>
    '';
  };
  
  valve-steamos-rules = pkgs.writeTextFile {
    name = "valve-steamos-rules";
    destination = "/share/polkit-1/rules.d/org.valve.steamos.rules";
    text = ''
      // Refer to: http://storaged.org/doc/udisks2-api/latest/udisks-polkit-actions.html
      polkit.log("STARTING")
      polkit.addRule(function(action, subject) {
          var YES = polkit.Result.YES;
          var permission = {
              // Used by Steam
              "org.freedesktop.udisks2.eject-media": YES,
              "org.freedesktop.udisks2.power-off-drive": YES,
              "org.freedesktop.udisks2.filesystem-unmount-others": YES,
              "org.freedesktop.udisks2.eject-media-other-seat": YES,
              "org.freedesktop.udisks2.power-off-drive-other-seat": YES,
          };

          if (subject.isInGroup("wheel")) {
              return permission[action.id];
          }
      });
    '';
  };
}