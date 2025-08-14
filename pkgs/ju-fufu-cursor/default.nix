{
  stdenvNoCC,
  ...
}:
stdenvNoCC.mkDerivation {
  name = "ju-fufu-cursor";

  src = ./src;

  installPhase = ''
    runHook preInstall

      local iconsDir="$out"/share/icons

      mkdir -p "$iconsDir"

      mv "Ju-Fufu" "$iconsDir"

    runHook postInstall
  '';
}
