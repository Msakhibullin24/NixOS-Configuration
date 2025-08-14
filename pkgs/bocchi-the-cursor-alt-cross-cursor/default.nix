{
  stdenvNoCC,
  ...
}:
stdenvNoCC.mkDerivation {
  name = "bocchi-the-cursor-alt-cross-cursor";

  src = ./src;

  installPhase = ''
    runHook preInstall

      local iconsDir="$out"/share/icons

      mkdir -p "$iconsDir"

      mv "Bocchi-The-Cursor-Alt-Cross" "$iconsDir"

    runHook postInstall
  '';
}
