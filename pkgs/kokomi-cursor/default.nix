{
  stdenvNoCC,
  ...
}:
stdenvNoCC.mkDerivation {
  name = "kokomi-cursor";

  src = ./src;

  installPhase = ''
    runHook preInstall

      local iconsDir="$out"/share/icons

      mkdir -p "$iconsDir"

      mv "Kokomi" "$iconsDir"

    runHook postInstall
  '';
}
