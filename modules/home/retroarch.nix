{ pkgs, ... }: 
{
  home.packages = (with pkgs; [
    (retroarch.overrideAttrs (oldAttrs: {
      cores = with libretro; [
        fceumm
        gambatte
        mgba
        snes9x
      ];
    }
    ))
  ]);
}
