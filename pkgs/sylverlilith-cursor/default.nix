{
  stdenvNoCC,
  ...
}:
stdenvNoCC.mkDerivation {
  name = "sylverlilith-cursor";

  src = ./src;

  installPhase = ''
    runHook preInstall

      local iconsDir="$out"/share/icons

      mkdir -p "$iconsDir"

      mv "Sylverlilith" "$iconsDir"

    runHook postInstall
  '';
}
