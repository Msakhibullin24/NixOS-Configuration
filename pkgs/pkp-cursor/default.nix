{
  stdenvNoCC,
  ...
}:
stdenvNoCC.mkDerivation {
  name = "pkp-cursor";

  src = ./src;

  installPhase = ''
    runHook preInstall

      local iconsDir="$out"/share/icons

      mkdir -p "$iconsDir"

      mv "PKP" "$iconsDir"

    runHook postInstall
  '';
}
