{
  stdenvNoCC,
  ...
}:
stdenvNoCC.mkDerivation {
  name = "ninomae-inanis-cursor";

  src = ./src;

  installPhase = ''
    runHook preInstall

      local iconsDir="$out"/share/icons

      mkdir -p "$iconsDir"

      mv "Ninomae-Ina'nis" "$iconsDir"

    runHook postInstall
  '';
}
