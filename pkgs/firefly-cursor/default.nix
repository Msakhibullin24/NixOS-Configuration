{
  stdenvNoCC,
  ...
}:
stdenvNoCC.mkDerivation {
  name = "firefly-cursor";

  src = ./src;

  installPhase = ''
    runHook preInstall

      local iconsDir="$out"/share/icons

      mkdir -p "$iconsDir"

      mv "Firefly" "$iconsDir"

    runHook postInstall
  '';
}
