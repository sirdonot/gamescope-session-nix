# Steam session for NixOS
Steam session under gamescope, tweaked for NixOS.

## List of tweaks
- Exporting variables for a better compatibility under xwayland and etc.
- Fixes issues related to the SteamOS Deck specific instructions(tries to at least).

## Adding on your nix config

First add the gamescope-session flake to your flake.nix

```nix
gamescope-session = {
  url = "github:sirdonot/gamescope-session-nix";
  inputs.nixpkgs.follows = "nixpkgs";
};
```

Adding gamescope-session to your environment.systemPackages

```nix
{ inputs, ...}:

{
  environment.systemPackages = [
    inputs.gamescope-session.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
```
After rebuilding, gamescope-session will be installed on your system. 

> [!NOTE]
>
> A shout-out to [shahnawazshahin](https://github.com/shahnawazshahin) for making his [steam-using-gamescope-guide](https://github.com/shahnawazshahin/steam-using-gamescope-guide), this flake is based on his scripts.
