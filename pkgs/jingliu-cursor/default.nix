{
  stdenvNoCC,
  ...
}:
stdenvNoCC.mkDerivation {
  name = "jingliu-cursor";

  src = ./src;

  installPhase = ''
    runHook preInstall

      local iconsDir="$out"/share/icons

      mkdir -p "$iconsDir"

      mv "Jingliu" "$iconsDir"

    runHook postInstall
  '';
}
