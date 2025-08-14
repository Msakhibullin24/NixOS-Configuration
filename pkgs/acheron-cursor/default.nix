{
  stdenvNoCC,
  ...
}:
stdenvNoCC.mkDerivation {
  name = "acheron-cursor";

  src = ./src;

  installPhase = ''
    runHook preInstall

      local iconsDir="$out"/share/icons

      mkdir -p "$iconsDir"

      mv "Acheron" "$iconsDir"

    runHook postInstall
  '';
}
