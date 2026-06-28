{ pkgs }:
let
  helpers = (import ./steamos-polkit-helpers.nix { inherit pkgs; }) // (import ./helper-modules.nix { inherit pkgs; });

  # Commenting this out until i figure what to do with it
  #policy = import ./org.valve.steamos.nix { inherit pkgs; };
  session = import ./gamescope-session.nix { inherit pkgs; };
in
pkgs.symlinkJoin {
  name = "gamescope-session";
  paths =
    builtins.attrValues helpers ++ 
    # builtins.attrValues policy ++
    [ session ];
}
